use std::{collections::HashMap, io::Write};

use super::{Backend, OutputKind};

#[allow(unused)]
enum Instruction {
    Call { byte_off: i32 },
    MovR11 { abs_addr: usize },
    MovRbxRdi,
    JmpR11,
    AddByteMemRbx { byte_off: i32, val: u8 },
    LeaRbxRbx { byte_off: i32 },
    LeaRdiRbx { byte_off: i32 },
    Je { byte_off: i32 },
    Jne { byte_off: i32 },
    CmpByteMemZero { byte_off: i32 },
    Ret,
    Jmp { byte_off: i32 },
    PopRbx,
    PushRbx,
    // extras
    Syscall,
    MoveImmRax(i32),
    MoveImmRdi(i32),
    MoveImmRdx(i32),
    MoveRsiRdi,
    PushU8(u8),
    MoveRsiRsp,
    AddImmRsp(i32),
    LeaRsiRbx { byte_off: i32 },
    MovRbxRsp,
    Hlt,
    MoveRbxImmImmByte { byte_off: i32, val: u8 },
}

impl Instruction {
    pub fn size(&self) -> u64 {
        match self {
            Instruction::Call { .. } => 5,
            Instruction::MovR11 { .. } => 10,
            Instruction::MovRbxRdi => 3,
            Instruction::JmpR11 => 3,
            Instruction::AddByteMemRbx { byte_off, .. } => {
                if *byte_off == 0 {
                    3
                } else if (-128..128).contains(byte_off) {
                    4
                } else {
                    7
                }
            }
            Instruction::LeaRbxRbx { byte_off } => {
                if *byte_off == 0 {
                    3
                } else if (-128..128).contains(byte_off) {
                    4
                } else {
                    7
                }
            }
            Instruction::LeaRdiRbx { byte_off } => {
                if *byte_off == 0 {
                    3
                } else if (-128..128).contains(byte_off) {
                    4
                } else {
                    7
                }
            }
            Instruction::Je { byte_off } => {
                if (-128..128).contains(byte_off) {
                    2
                } else {
                    6
                }
            }
            Instruction::Jne { byte_off } => {
                if (-128..128).contains(byte_off) {
                    2
                } else {
                    6
                }
            }
            Instruction::CmpByteMemZero { byte_off } => {
                if *byte_off == 0 {
                    3
                } else if (-128..128).contains(byte_off) {
                    4
                } else {
                    7
                }
            }
            Instruction::Ret => 1,
            Instruction::Jmp { byte_off } => {
                if (-128..128).contains(byte_off) {
                    2
                } else {
                    5
                }
            }
            Instruction::PopRbx => 1,
            Instruction::PushRbx => 1,

            Instruction::Syscall => 2,
            Instruction::MoveImmRax(_) => 5,
            Instruction::MoveImmRdi(_) => 5,
            Instruction::MoveImmRdx(_) => 5,
            Instruction::MoveRsiRdi => 3,
            Instruction::PushU8(_) => 2,
            Instruction::MoveRsiRsp => 3,
            Instruction::AddImmRsp(val) => {
                if (-128..128).contains(val) {
                    4
                } else {
                    7
                }
            }
            Instruction::LeaRsiRbx { byte_off } => {
                if *byte_off == 0 {
                    3
                } else if (-128..128).contains(byte_off) {
                    4
                } else {
                    7
                }
            }
            Instruction::MovRbxRsp => 3,
            Instruction::Hlt => 1,
            Instruction::MoveRbxImmImmByte { byte_off, .. } => {
                if *byte_off == 0 {
                    3
                } else if (-128..128).contains(byte_off) {
                    4
                } else {
                    7
                }
            }
        }
    }

    pub fn to_bytes(&self, out: &mut impl std::io::Write) -> std::io::Result<()> {
        match self {
            Instruction::Call { byte_off } => {
                out.write_all(&[0xe8])?;
                out.write_all(&(*byte_off as i32).to_le_bytes())
            }
            Instruction::MovR11 { abs_addr } => {
                out.write_all(&[0x49, 0xbb])?;
                out.write_all(&(*abs_addr as i64).to_le_bytes())
            }
            Instruction::MovRbxRdi => out.write_all(&[0x48, 0x89, 0xfb]),
            Instruction::JmpR11 => out.write_all(&[0x41, 0xff, 0xe3]),
            Instruction::AddByteMemRbx { byte_off, val } => {
                if *byte_off == 0 {
                    out.write_all(&[0x80, 0x03])?;
                    out.write_all(&[*val])
                } else if (-128..128).contains(byte_off) {
                    out.write_all(&[0x80, 0x43])?;
                    out.write_all(&(*byte_off as i8).to_le_bytes())?;
                    out.write_all(&[*val])
                } else {
                    out.write_all(&[0x80, 0x83])?;
                    out.write_all(&(*byte_off as i32).to_le_bytes())?;
                    out.write_all(&[*val])
                }
            }
            Instruction::LeaRbxRbx { byte_off } => {
                if *byte_off == 0 {
                    out.write_all(&[0x48, 0x8d, 0x1b])
                } else if (-128..128).contains(byte_off) {
                    out.write_all(&[0x48, 0x8d, 0x5b])?;
                    out.write_all(&(*byte_off as i8).to_le_bytes())
                } else {
                    out.write_all(&[0x48, 0x8d, 0x9b])?;
                    out.write_all(&(*byte_off as i32).to_le_bytes())
                }
            }
            Instruction::LeaRdiRbx { byte_off } => {
                if *byte_off == 0 {
                    out.write_all(&[0x48, 0x8d, 0x3b])
                } else if (-128..128).contains(byte_off) {
                    out.write_all(&[0x48, 0x8d, 0x7b])?;
                    out.write_all(&(*byte_off as i8).to_le_bytes())
                } else {
                    out.write_all(&[0x48, 0x8d, 0xbb])?;
                    out.write_all(&(*byte_off as i32).to_le_bytes())
                }
            }
            Instruction::Je { byte_off } => {
                if (-128..128).contains(byte_off) {
                    out.write_all(&[0x74])?;
                    out.write_all(&(*byte_off as i8).to_le_bytes())
                } else {
                    out.write_all(&[0x0f, 0x84])?;
                    out.write_all(&(*byte_off as i32).to_le_bytes())
                }
            }
            Instruction::Jne { byte_off } => {
                if (-128..128).contains(byte_off) {
                    out.write_all(&[0x75])?;
                    out.write_all(&(*byte_off as i8).to_le_bytes())
                } else {
                    out.write_all(&[0x0f, 0x85])?;
                    out.write_all(&(*byte_off as i32).to_le_bytes())
                }
            }
            Instruction::CmpByteMemZero { byte_off } => {
                if *byte_off == 0 {
                    out.write_all(&[0x80, 0x3b, 0x00])
                } else if (-128..128).contains(byte_off) {
                    out.write_all(&[0x80, 0x7b])?;
                    out.write_all(&(*byte_off as i8).to_le_bytes())?;
                    out.write_all(&[0x00])
                } else {
                    out.write_all(&[0x80, 0xbb, 0xbb])?;
                    out.write_all(&(*byte_off as i32).to_le_bytes())?;
                    out.write_all(&[0x00])
                }
            }
            Instruction::Ret => out.write_all(&[0xc3]),
            Instruction::Jmp { byte_off } => {
                if (-128..128).contains(byte_off) {
                    out.write_all(&[0xeb])?;
                    out.write_all(&(*byte_off as i8).to_le_bytes())
                } else {
                    out.write_all(&[0xe9])?;
                    out.write_all(&(*byte_off as i32).to_le_bytes())
                }
            }
            Instruction::PopRbx => out.write_all(&[0x5b]),
            Instruction::PushRbx => out.write_all(&[0x53]),

            Instruction::Syscall => out.write_all(&[0x0f, 0x05]),
            Instruction::MoveImmRax(imm) => {
                out.write_all(&[0xb8])?;
                out.write_all(&imm.to_le_bytes())
            }
            Instruction::MoveImmRdi(imm) => {
                out.write_all(&[0xbf])?;
                out.write_all(&imm.to_le_bytes())
            }
            Instruction::MoveImmRdx(imm) => {
                out.write_all(&[0xba])?;
                out.write_all(&imm.to_le_bytes())
            }
            Instruction::MoveRsiRdi => out.write_all(&[0x48, 0x89, 0xfe]),
            Instruction::PushU8(val) => out.write_all(&[0x6a, *val]),
            Instruction::MoveRsiRsp => out.write_all(&[0x48, 0x89, 0xe6]),
            Instruction::AddImmRsp(val) => {
                if (-128..128).contains(val) {
                    out.write_all(&[0x48, 0x83, 0xc4, *val as u8])
                } else {
                    out.write_all(&[0x48, 0x81, 0xc4])?;
                    out.write_all(&(*val).to_le_bytes())
                }
            }
            Instruction::LeaRsiRbx { byte_off } => {
                if *byte_off == 0 {
                    out.write_all(&[0x48, 0x8d, 0x33])
                } else if (-128..128).contains(byte_off) {
                    out.write_all(&[0x48, 0x8d, 0x73])?;
                    out.write_all(&(*byte_off as i8).to_le_bytes())
                } else {
                    out.write_all(&[0x48, 0x8d, 0xb3])?;
                    out.write_all(&(*byte_off as i32).to_le_bytes())
                }
            }
            Instruction::MovRbxRsp => out.write_all(&[0x48, 0x89, 0xe3]),
            Instruction::Hlt => out.write_all(&[0xf4]),
            Instruction::MoveRbxImmImmByte { byte_off, val } => {
                if *byte_off == 0 {
                    out.write_all(&[0xc6, 0x03, *val])
                } else if (-128..128).contains(byte_off) {
                    out.write_all(&[0xc6, 0x43, *byte_off as u8, *val as u8])
                } else {
                    out.write_all(&[0xc6, 0x83])?;
                    out.write_all(&(*byte_off as u32).to_le_bytes())?;
                    out.write_all(&[*val as u8])
                }
            }
        }
    }

    fn reloc(&mut self, start_inst: u64, to: u64) {
        match self {
            Self::Jmp { byte_off } => {
                *byte_off = (to as i64 - (start_inst as i64 + 2)) as i32;
                if !(-128..128).contains(byte_off) {
                    *byte_off -= 3;
                }
            }
            Self::Je { byte_off } | Self::Jne { byte_off } => {
                *byte_off = (to as i64 - (start_inst as i64 + 2)) as i32;
                if !(-128..128).contains(byte_off) {
                    *byte_off -= 4;
                }
            }
            Self::Call { byte_off } => {
                *byte_off = (to as i64 - (start_inst as i64 + 5)) as i32;
            }
            _ => {}
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
struct SymbolId(usize);

#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
struct InstructionIndex(usize);

#[derive(Default, Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord)]
struct Symbol {
    byte_off: u64,
    instruction_off: usize,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[allow(unused)]
pub enum IoKind {
    UserDefinedIO {
        print: extern "C" fn(&u8),
        read: extern "C" fn(&mut u8),
    },
    PreDefinedIO,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum StackKind {
    Provided,
    CreateN(u64),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum EndKind {
    Return,
    Kill,
}

pub struct MachineGen<T: Write> {
    out: T,
    instruction: Vec<Instruction>,
    byte_off: u64,
    symbol_queue: Vec<SymbolId>,

    symbols: Vec<Symbol>,
    symbols_ins: HashMap<InstructionIndex, SymbolId>,

    relocs: HashMap<InstructionIndex, SymbolId>,

    io: IoKind,
    stack: StackKind,
    end: EndKind,

    output: OutputKind,
}

impl<T: Write> MachineGen<T> {
    pub fn default(out: T, io: IoKind) -> Self {
        Self {
            out,
            symbol_queue: Vec::new(),
            byte_off: 0,
            io,
            instruction: Vec::new(),
            symbols_ins: HashMap::new(),
            relocs: HashMap::new(),
            symbols: Vec::new(),
            stack: StackKind::Provided,
            end: EndKind::Return,
            output: OutputKind::Binary,
        }
    }

    pub fn set_stack_kind(mut self, kind: StackKind) -> Self {
        self.stack = kind;
        self
    }

    pub fn set_output_kind(mut self, kind: OutputKind) -> Self {
        self.output = kind;
        self
    }

    pub fn set_end_kind(mut self, kind: EndKind) -> Self {
        self.end = kind;
        self
    }

    fn begin_section(&mut self) -> (SymbolId, SymbolId) {
        let old = self.symbols.len();
        self.symbols.push(Symbol::default());
        self.symbols.push(Symbol::default());
        self.symbol_queue.push(SymbolId(old));
        (SymbolId(old), SymbolId(old + 1))
    }

    fn end_section(&mut self) -> (SymbolId, SymbolId) {
        let old = self.symbol_queue.pop().unwrap();
        (SymbolId(old.0), SymbolId(old.0 + 1))
    }

    fn push_reloc_instrucion(&mut self, symbol: SymbolId, inst: Instruction) {
        self.relocs
            .insert(InstructionIndex(self.instruction.len()), symbol);
        self.push_instrucion(inst);
    }

    fn push_symbol(&mut self) -> SymbolId {
        self.symbols.push(Symbol {
            byte_off: self.byte_off,
            instruction_off: self.instruction.len(),
        });
        SymbolId(self.symbols.len() - 1)
    }

    fn push_instrucion(&mut self, instruction: Instruction) {
        self.byte_off += instruction.size();
        self.instruction.push(instruction);
    }

    fn update_symbol_to_current(&mut self, start: SymbolId) {
        self.symbols[start.0].instruction_off = self.instruction.len();
        self.symbols_ins
            .insert(InstructionIndex(self.instruction.len()), start);
        self.symbols[start.0].byte_off = self.byte_off;
    }
}

impl<T: Write> Backend<T> for MachineGen<T> {
    fn new(out: T, settings: super::Settings, _additional: String) -> Self {
        Self::default(out, IoKind::PreDefinedIO)
            .set_end_kind(EndKind::Kill)
            .set_stack_kind(StackKind::CreateN(settings.stacksize))
            .set_output_kind(settings.output)
    }

    fn visit_start(&mut self) {
        match self.end {
            EndKind::Kill => {}
            EndKind::Return => {
                self.push_instrucion(Instruction::PushRbx);
            }
        }

        match self.stack {
            StackKind::Provided => {
                self.push_instrucion(Instruction::MovRbxRdi);
            }
            StackKind::CreateN(size) => {
                for _ in 0..((size + 7) / 8) {
                    self.push_instrucion(Instruction::PushU8(0));
                }
                self.push_instrucion(Instruction::MovRbxRsp);
            }
        }

        match self.io {
            IoKind::UserDefinedIO { print, read } => {
                // known offset from known instruction
                self.push_reloc_instrucion(SymbolId(2), Instruction::Jmp { byte_off: 0x1a });

                self.push_symbol();
                self.push_instrucion(Instruction::MovR11 {
                    abs_addr: print as *const () as usize,
                });
                self.push_instrucion(Instruction::JmpR11);

                self.push_symbol();
                self.push_instrucion(Instruction::MovR11 {
                    abs_addr: read as *const () as usize,
                });
                self.push_instrucion(Instruction::JmpR11);

                self.push_symbol();
            }
            IoKind::PreDefinedIO => {}
        }
    }

    fn visit_end(&mut self) {
        match self.end {
            EndKind::Return => {
                match self.stack {
                    StackKind::CreateN(mut size) => {
                        size = ((size + 7) / 8) * 8;
                        loop {
                            if size > i32::MAX as u64 {
                                self.push_instrucion(Instruction::AddImmRsp(i32::MAX));
                                size -= i32::MAX as u64;
                            } else {
                                self.push_instrucion(Instruction::AddImmRsp(size as i32));
                                break;
                            }
                        }
                    }
                    _ => {}
                }

                self.push_instrucion(Instruction::PopRbx);
                self.instruction.push(Instruction::Ret);
            }
            EndKind::Kill => {
                self.instruction.push(Instruction::MoveImmRdi(0));
                self.instruction.push(Instruction::MoveImmRax(60));
                self.instruction.push(Instruction::Syscall);
            }
        }

        match self.output {
            OutputKind::Asm => todo!(),
            OutputKind::Ir => todo!(),

            OutputKind::Binary | OutputKind::Elf => {
                loop {
                    let mut changed = false;

                    let mut current_byte = 0;
                    for (index, inst) in self.instruction.iter_mut().enumerate() {
                        if let Some(index) = self.symbols_ins.get(&InstructionIndex(index)) {
                            if current_byte != self.symbols[index.0].byte_off {
                                changed = true;
                                self.symbols[index.0].byte_off = current_byte;
                            }
                        }
                        if let Some(symbol) = self.relocs.get(&InstructionIndex(index)) {
                            let to = self.symbols[symbol.0].byte_off;
                            inst.reloc(current_byte, to);
                        }
                        current_byte += inst.size();
                    }

                    if !changed {
                        break;
                    }
                }

                if self.output == OutputKind::Binary {
                    for ins in &self.instruction {
                        ins.to_bytes(&mut self.out).unwrap()
                    }
                } else {
                    let mut out = Vec::new();
                    for ins in &self.instruction {
                        ins.to_bytes(&mut out).unwrap()
                    }
                    write_elf(&mut self.out, &out).expect("Failed to write output");
                }
            }
        }
    }

    fn visit_while_start(&mut self, ptr_off: i64) {
        let (start, end) = self.begin_section();
        self.push_instrucion(Instruction::CmpByteMemZero {
            byte_off: ptr_off as i32,
        });
        self.push_reloc_instrucion(end, Instruction::Je { byte_off: -2 });
        self.update_symbol_to_current(start);
    }

    fn visit_while_end(&mut self, ptr_off: i64) {
        let (start, end) = self.end_section();
        self.push_instrucion(Instruction::CmpByteMemZero {
            byte_off: ptr_off as i32,
        });

        let wanted = self.symbols[start.0].byte_off as i64;
        let mut current = (self.byte_off + 2) as i64;
        if !(-128..127).contains(&current) {
            current += 3;
        }

        self.push_reloc_instrucion(
            start,
            Instruction::Jne {
                byte_off: (current - wanted) as i32,
            },
        );
        self.update_symbol_to_current(end);
    }

    fn visit_mem_off(&mut self, val: u8, byte_off: i64) {
        if val != 0 {
            self.push_instrucion(Instruction::AddByteMemRbx {
                byte_off: byte_off as i32,
                val,
            });
        }
    }

    fn visit_mem_set(&mut self, val: u8, off: i64) {
        self.push_instrucion(Instruction::MoveRbxImmImmByte {
            byte_off: off as i32,
            val,
        })
    }

    fn visit_ptr_off(&mut self, byte_off: i64) {
        if byte_off != 0 {
            self.push_instrucion(Instruction::LeaRbxRbx {
                byte_off: byte_off as i32,
            });
        }
    }

    fn visit_print(&mut self, byte_off: i64) {
        match self.io {
            IoKind::UserDefinedIO { .. } => {
                self.push_instrucion(Instruction::LeaRdiRbx {
                    byte_off: byte_off as i32,
                });
                let wanted = self.symbols[0].byte_off as i64;
                let current = (self.byte_off + 5) as i64;
                self.push_reloc_instrucion(
                    SymbolId(0),
                    Instruction::Call {
                        byte_off: (current - wanted) as i32,
                    },
                );
            }
            IoKind::PreDefinedIO => {
                self.push_instrucion(Instruction::MoveImmRax(1)); // sys_write
                self.push_instrucion(Instruction::MoveImmRdi(1)); // stdout
                self.push_instrucion(Instruction::MoveImmRdx(1)); // length
                self.push_instrucion(Instruction::LeaRsiRbx {
                    byte_off: byte_off as i32,
                });
                self.push_instrucion(Instruction::Syscall);
            }
        }
    }

    fn visit_read(&mut self, byte_off: i64) {
        match self.io {
            IoKind::UserDefinedIO { .. } => {
                self.push_instrucion(Instruction::LeaRdiRbx {
                    byte_off: byte_off as i32,
                });
                let wanted = self.symbols[1].byte_off as i64;
                let current = (self.byte_off + 5) as i64;
                self.push_reloc_instrucion(
                    SymbolId(1),
                    Instruction::Call {
                        byte_off: (current - wanted) as i32,
                    },
                );
            }
            IoKind::PreDefinedIO => {
                self.push_instrucion(Instruction::MoveImmRax(0)); // sys_read
                self.push_instrucion(Instruction::MoveImmRdi(0)); // stdin
                self.push_instrucion(Instruction::MoveImmRdx(1)); // length
                self.push_instrucion(Instruction::LeaRsiRbx {
                    byte_off: byte_off as i32,
                });
                self.push_instrucion(Instruction::Syscall);
            }
        }
    }
}

// ----------- ELF ---------

trait ReprBytes: Sized {
    fn repr_bytes<'a>(&'a self) -> &'a [u8] {
        unsafe {
            std::slice::from_raw_parts(
                self as *const Self as *const u8,
                std::mem::size_of::<Self>(),
            )
        }
    }
}

macro_rules! impl_ints {
    ($type:ty, $int:ty) => {
        impl std::convert::From<$int> for $type {
            fn from(value: $int) -> Self {
                Self(value.to_le_bytes())
            }
        }
        impl std::convert::From<$type> for $int {
            fn from(value: $type) -> Self {
                Self::from_le_bytes(value.0)
            }
        }

        impl ReprBytes for $type {
            fn repr_bytes(&self) -> &[u8] {
                &self.0
            }
        }
    };
}

impl std::convert::From<bool> for U8LE {
    fn from(value: bool) -> Self {
        Self(if value { 1 } else { 0u8 }.to_le_bytes())
    }
}

#[repr(C)]
#[derive(Default, Clone, Copy, PartialEq, Eq, Hash)]
struct U8LE([u8; 1]);
#[repr(C)]
#[derive(Default, Clone, Copy, PartialEq, Eq, Hash)]
struct U16LE([u8; 2]);
#[repr(C)]
#[derive(Default, Clone, Copy, PartialEq, Eq, Hash)]
struct U32LE([u8; 4]);
#[repr(C)]
#[derive(Default, Clone, Copy, PartialEq, Eq, Hash)]
struct USizeLE([u8; 8]);

impl_ints!(U8LE, u8);
impl_ints!(U16LE, u16);
impl_ints!(U32LE, u32);
impl_ints!(USizeLE, u64);

#[repr(C, packed)]
struct Header {
    magic: [u8; 4],
    class: U8LE,
    data: U8LE,
    version: U8LE,
    osabi: U8LE,
    abiversion: U8LE,
    pad: [u8; 7],
    f_type: U16LE,
    machine: U16LE,
    version_2: U32LE,
    entry: USizeLE,
    program_header_off: USizeLE,
    section_header_off: USizeLE,
    flags: U32LE,
    header_size: U16LE,

    program_header_size: U16LE,
    program_header_num: U16LE,

    section_header_size: U16LE,
    section_header_num: U16LE,

    index_section_header_names: U16LE,
}

impl ReprBytes for Header {}

#[repr(C, packed)]
#[derive(Default)]
struct ProgramHeader {
    p_type: U32LE,
    flags: U32LE,
    file_offset: USizeLE,
    virtual_addr: USizeLE,
    physical_addr: USizeLE,
    file_size: USizeLE,
    mem_size: USizeLE,
    align: USizeLE,
}
impl ReprBytes for ProgramHeader {}

#[repr(C, packed)]
#[derive(Default)]
struct SectionHeader {
    name_off: U32LE,
    s_type: U32LE,
    flags: USizeLE,
    virtual_address: USizeLE,
    file_off: USizeLE,
    file_size: USizeLE,
    link: U32LE,
    info: U32LE,
    addr_align: USizeLE,
    ent_size: USizeLE,
}

impl ReprBytes for SectionHeader {}

#[repr(C, packed)]
#[derive(Default)]
struct SymbolTableEntry {
    name: U32LE,
    info: U8LE,
    other: U8LE,
    section_index: U16LE,
    addr: USizeLE,
    sym_size: USizeLE,
}

impl ReprBytes for SymbolTableEntry {}

fn write_elf(file: &mut impl std::io::Write, instructions: &[u8]) -> std::io::Result<()> {
    const PROGRAM_HEADERS: usize = 1;
    const SECTION_HEADERS: usize = 4;
    const SYMBOLS: usize = 2;
    const PROGRAM_ALIGN: u64 = 0x1000;
    const PROGRAM_START: u64 = 0x401000;

    macro_rules! construct_str_table {
        ($vis:vis mod $mode_name:ident{$table_name:ident, $($name:ident:$str:expr $(,)?)*}) => {
            $vis mod $mode_name{
                construct_str_table!("", $($name:$str),*);
                pub const $table_name: &str = concat!($(concat!($str, '\0'),)*);
            }
        };
        ($existing:expr, $name:ident:$str:expr, $($name_repr:ident:$str_repr:expr),*) => {
            pub const $name: usize = $existing.len();
            construct_str_table!(concat!($existing, $str, '\0'), $($name_repr:$str_repr),*);
        };
        ($existing:expr, $name:ident:$str:expr) => {
            pub const $name: usize = $existing.len();
        };
        ($existing:expr) => {
        };
    }

    construct_str_table!(mod str_table{TABLE, _EMPTY:"",TEXT:".text", STRTAB:".strtab", SYMTAB:".symtab", START:"_start"});

    let elf_header_start = 0;
    let program_header_start = elf_header_start + std::mem::size_of::<Header>();
    let section_header_start =
        program_header_start + std::mem::size_of::<ProgramHeader>() * PROGRAM_HEADERS;
    let str_table_start =
        section_header_start + std::mem::size_of::<SectionHeader>() * SECTION_HEADERS;

    let symbol_table_start = str_table_start + str_table::TABLE.len();

    let program_start_unaligned =
        symbol_table_start + std::mem::size_of::<SymbolTableEntry>() * SYMBOLS;

    let program_start_file =
        ((program_start_unaligned as u64 + PROGRAM_ALIGN - 1) / PROGRAM_ALIGN) * PROGRAM_ALIGN;

    let programs: [ProgramHeader; PROGRAM_HEADERS] = [ProgramHeader {
        p_type: 1.into(),  // PT_LOAD
        flags: 0x5.into(), // PT_READ PT_EXECUTE
        file_offset: program_start_file.into(),
        virtual_addr: PROGRAM_START.into(),
        physical_addr: PROGRAM_START.into(),
        file_size: (instructions.len() as u64).into(),
        mem_size: (instructions.len() as u64).into(),
        align: PROGRAM_ALIGN.into(),
    }];

    let sections: [SectionHeader; SECTION_HEADERS] = [
        SectionHeader::default(),
        SectionHeader {
            name_off: (str_table::STRTAB as u32).into(),
            s_type: 0x3.into(), // zero terminated string
            flags: 0.into(),
            virtual_address: 0.into(),
            file_off: (str_table_start as u64).into(),
            file_size: (str_table::TABLE.len() as u64).into(),
            link: 0.into(),
            info: 0.into(),
            addr_align: 1.into(),
            ent_size: 0.into(),
        },
        SectionHeader {
            name_off: (str_table::SYMTAB as u32).into(),
            s_type: 0x2.into(), // symbol table
            flags: 0.into(),
            virtual_address: 0.into(),
            file_off: (symbol_table_start as u64).into(),
            file_size: ((std::mem::size_of::<SymbolTableEntry>() * SYMBOLS) as u64).into(),
            link: 1.into(), // str table
            info: 1.into(), // first global symbol
            addr_align: 1.into(),
            ent_size: (std::mem::size_of::<SymbolTableEntry>() as u64).into(),
        },
        SectionHeader {
            name_off: (str_table::TEXT as u32).into(),
            s_type: 1.into(), // SHT_PROGBITS
            flags: 6.into(),  // flags A(allocate in image?) X(exacutable?)
            virtual_address: PROGRAM_START.into(),
            file_off: (program_start_file as u64).into(),
            file_size: (instructions.len() as u64).into(),
            link: 0.into(),
            info: 0.into(),
            addr_align: PROGRAM_ALIGN.into(),
            ent_size: 0.into(),
        },
    ];

    let symbols: [SymbolTableEntry; SYMBOLS] = [
        SymbolTableEntry::default(),
        SymbolTableEntry {
            name: (str_table::START as u32).into(),
            info: (0x12).into(),     //global function
            other: 0.into(),         // default
            section_index: 3.into(), //program section
            addr: PROGRAM_START.into(),
            sym_size: (instructions.len() as u64).into(),
        },
    ];

    let header = Header {
        magic: [0x7f, 0x45, 0x4c, 0x46],
        class: 2.into(),   // 64 bit
        data: 1.into(),    // le
        version: 1.into(), //version 1
        osabi: 1.into(),   // system-v
        abiversion: 0.into(),
        pad: [0; 7],
        f_type: 2.into(),     // executable file
        machine: 0x3E.into(), // x86-64
        version_2: 1.into(),
        entry: PROGRAM_START.into(),
        program_header_off: (program_header_start as u64).into(),
        section_header_off: (section_header_start as u64).into(),
        flags: 0.into(),
        header_size: (std::mem::size_of::<Header>() as u16).into(),
        program_header_size: (std::mem::size_of::<ProgramHeader>() as u16).into(),
        program_header_num: (PROGRAM_HEADERS as u16).into(),
        section_header_size: (std::mem::size_of::<SectionHeader>() as u16).into(),
        section_header_num: (SECTION_HEADERS as u16).into(),
        index_section_header_names: 1.into(),
    };

    file.write_all(header.repr_bytes())?;

    for ph in &programs {
        file.write_all(ph.repr_bytes())?;
    }

    for section in &sections {
        file.write_all(section.repr_bytes())?;
    }

    file.write_all(str_table::TABLE.as_bytes())?;

    for symbol in &symbols {
        file.write_all(symbol.repr_bytes())?;
    }

    // alignment
    for _ in program_start_unaligned..(program_start_file as usize) {
        file.write_all(&[0])?;
    }

    file.write_all(&instructions)
}
