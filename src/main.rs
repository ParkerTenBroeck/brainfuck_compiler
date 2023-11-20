#![feature(tuple_trait)]
#![feature(fn_traits)]
#![feature(unboxed_closures)]

mod brain;
mod dyn_link;

fn main() {
    let code = r#"
    [ This program prints "Hello World!" and a newline to the screen, its
    length is 106 active command characters. [It is not the shortest.]
  
    This loop is an "initial comment loop", a simple way of adding a comment
    to a BF program such that you don't have to worry about any command
    characters. Any ".", ",", "+", "-", "<" and ">" characters are simply
    ignored, the "[" and "]" characters just have to be balanced. This
    loop and the commands it contains are ignored because the current cell
    defaults to a value of 0; the 0 value causes this loop to be skipped.
  ]
  ++++++++               Set Cell #0 to 8
  [
      >++++               Add 4 to Cell #1; this will always set Cell #1 to 4
      [                   as the cell will be cleared by the loop
          >++             Add 2 to Cell #2
          >+++            Add 3 to Cell #3
          >+++            Add 3 to Cell #4
          >+              Add 1 to Cell #5
          <<<<-           Decrement the loop counter in Cell #1
      ]                   Loop until Cell #1 is zero; number of iterations is 4
      >+                  Add 1 to Cell #2
      >+                  Add 1 to Cell #3
      >-                  Subtract 1 from Cell #4
      >>+                 Add 1 to Cell #6
      [<]                 Move back to the first zero cell you find; this will
                          be Cell #1 which was cleared by the previous loop
      <-                  Decrement the loop Counter in Cell #0
  ]                       Loop until Cell #0 is zero; number of iterations is 8
  
  The result of this is:
  Cell no :   0   1   2   3   4   5   6
  Contents:   0   0  72 104  88  32   8
  Pointer :   ^
  
  >>.                     Cell #2 has value 72 which is 'H'
  >---.                   Subtract 3 from Cell #3 to get 101 which is 'e'
  +++++++..+++.           Likewise for 'llo' from Cell #3
  >>.                     Cell #5 is 32 for the space
  <-.                     Subtract 1 from Cell #4 for 87 to give a 'W'
  <.                      Cell #3 was set to 'o' from the end of 'Hello'
  +++.------.--------.    Cell #3 for 'rl' and 'd'
  >>+.                    Add 1 to Cell #5 gives us an exclamation point
  >++.                    And finally a newline from Cell #6    
"#;
    use crate::brain::{interpret::BrainInterpret, parser::Brain};
    use crate::brain::{interpret::BrainInterpretIr, codegen::machine::MachineGen};


    let ast = Brain::new(code).parse();
    println!("{:#?}", ast);
    BrainInterpret::new().interpret(&ast);
    let ir = brain::ast_to_ir::ast_to_ir(ast);
    println!("{:#?}", ir);
    BrainInterpretIr::new().interpret(&ir);

    extern "C" fn print(char: &u8) {
        print!("{}", *char as char);
    }
    extern "C" fn read(char: &mut u8) {
        *char = 0;
    }

    let mut instructions = Vec::new();
    let mut visiter = MachineGen::new(&mut instructions, print, read);
    brain::visitor::visit_all(&ir, &mut visiter);
    // std::fs::write("./out.bin", &asm).unwrap();
    // println!("{:02x?}", asm);


    use mmap::{MapOption, MemoryMap};

    let map = MemoryMap::new(
        instructions.len(),
        &[
            MapOption::MapReadable,
            MapOption::MapWritable,
            MapOption::MapExecutable,
        ],
    )
    .unwrap();

    unsafe{
        std::ptr::copy(instructions.as_ptr(), map.data(), instructions.len());
        let func: extern "C" fn(*mut u8) = std::mem::transmute(map.data());

        let mut vals = [0u8; 100];
        func(vals.as_mut_slice().as_mut_ptr());
    }
}
