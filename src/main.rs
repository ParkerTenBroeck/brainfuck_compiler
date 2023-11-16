#![feature(tuple_trait)]
#![feature(fn_traits)]
#![feature(unboxed_closures)]
#![feature(ptr_metadata)]

use std::{collections::HashMap};

use mmap::{MapOption, MemoryMap};

extern "C" fn print(val: i32) {
    println!("{val}");
}

extern "C" fn bruh() -> i32{
    println!("asd;lasd;klasd;klasd;klasd;klasd");

    1
}

static BASIC_2: &[u8] = include_bytes!("../xtra/out/raw.bin");

static BASIC: &[u8] = &[
    // void test(int val){
    //     for(int i = 0; i < val; i ++){
    //         print(i);
    //     }
    // }
    0x85, 0xff, //test edi, edi
    0x7e, 0x24, //jle 17
    0x55, //push   %rbp
    0x89, 0xfd, //   	mov    %edi,%ebp
    0x53, //  	push   %rbx
    0x31, 0xdb, //   	xor    %ebx,%ebx
    0x48, 0x83, 0xec, 0x08, //     	sub    $0x8,%rsp
    0x66, 0x90, //   	xchg   %ax,%ax
    0x89, 0xdf, //   	mov    %ebx,%edi
    0x83, 0xc3, 0x01, //    	add    $0x1,%ebx
    0xe8, 0x0f, 0x00, 0x00,
    0x00, //       	call   4011a0 <_Z5printi> (really calls the special thing at the end of the function)
    0x39, 0xdd, //   	cmp    %ebx,%ebp
    0x75, 0xf2, //   	jne    4011c0 <_Z4testi+0x10>
    0x48, 0x83, 0xc4, 0x08, //   	add    $0x8,%rsp
    0x5b, //  	pop    %rbx
    0x5d, //  	pop    %rbp
    0xc3, //  	ret
    0x0f, 0x1f, 0x00, //   	nopl   (%rax)
    0xc3, //    ret
    // how we dynamic link
    // the address between the blocks is replaced at runtime with the real
    // address of the function we want to call
    0x49, 0xbb, /*replace*/ 0xef, 0xcd, 0xab, 0x89, 0x67, 0x45, 0x32, 0x01, /*replace*/
    //movabs () -> r11
    0x41, 0xff, 0xe3, // jmp r11
];


unsafe fn reflect(instructions: &[u8], relocs: DynRelocs, dyn_syms: &HashMap<String, usize>) {
    let map = MemoryMap::new(
        instructions.len(),
        &[
            MapOption::MapReadable,
            MapOption::MapWritable,
            MapOption::MapExecutable,
        ],
    )
    .unwrap();

    std::ptr::copy(instructions.as_ptr(), map.data(), instructions.len());

    let slice = std::slice::from_raw_parts_mut(map.data(), instructions.len());

    // let address = 0x000000000000005e + 2usize;

    // let address: &mut [u8; 8] = (&mut slice[address..(address + 8)]).try_into().unwrap();

    // let bruh: extern "C" fn(i32) = print;
    // let val = bruh as *const ();
    // *address = (val as usize).to_le_bytes();

    for reloc in relocs{
        let addr = *dyn_syms.get(reloc.0).unwrap();
        let offset = reloc.1 as usize;
        let address: &mut [u8; 8] = (&mut slice[offset..(offset + 8)]).try_into().unwrap();
        *address = (addr).to_le_bytes();
    }

    let func: extern "C" fn(i32) = std::mem::transmute(map.data());

    func(10);
}


#[derive(Clone, Copy)]
struct DynRelocs<'a>{
    data: &'a [u8],
    index: usize,
}

impl<'a> DynRelocs<'a>{
    pub fn new(data: &'a[u8]) -> Self{
        Self { data, index: 0 }
    }
}

impl<'a> Iterator for DynRelocs<'a>{
    type Item = (&'a str, u64);

    fn next(&mut self) -> Option<Self::Item> {
        if self.data.len() < self.index + 8{
            self.index = self.data.len();
            return None;
        }
        let pos: [u8; 8] = (&self.data[self.index..(self.index + 8)]).try_into().ok()?;
        let pos = u64::from_be_bytes(pos);
        self.index += 8;

        if self.data.len() < self.index + 2{
            self.index = self.data.len();
            return None;
        }
        let size: [u8; 2] = (&self.data[self.index..(self.index + 2)]).try_into().ok()?;
        let size = u16::from_be_bytes(size) as usize;
        self.index += 2;

        if self.data.len() < self.index + size{
            self.index = self.data.len();
            return None;
        }
        let sym = &self.data[self.index..(self.index + size)];
        let sym = std::str::from_utf8(sym).ok()?;
        self.index += size;

        Some((sym, pos))
    }
}

fn main() {

    let relocs = DynRelocs::new(include_bytes!("../xtra/out/syms"));
    let mut map = HashMap::new();

    map.insert("print".into(), (print as *const()) as usize);
    map.insert("lol_jpg".into(), (bruh as *const()) as usize);

    unsafe { reflect(include_bytes!("../xtra/out/raw.bin"), relocs, &map) }

}
