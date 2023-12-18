use std::{collections::HashMap, io::Write};

use crate::brain::visitor::Visitor;

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
            Instruction::MoveRbxImmImmByte { byte_off, val } => if *byte_off == 0 {
                    3
                } else if (-128..128).contains(byte_off) {
                    4
                } else {
                    7
                },
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
            Instruction::MoveRbxImmImmByte { byte_off, val } => if *byte_off == 0 {
                out.write_all(&[0xc6, 0x03, *val])
            } else if (-128..128).contains(byte_off) {
                out.write_all(&[0xc6, 0x43, *byte_off as u8, *val as u8])
            } else {
                out.write_all(&[0xc6, 0x83])?;
                out.write_all(&(*byte_off as u32).to_le_bytes())?;
                out.write_all(&[*val as u8])
            },
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
    asm: T,
    instruction: Vec<Instruction>,
    byte_off: u64,
    symbol_queue: Vec<SymbolId>,

    symbols: Vec<Symbol>,
    symbols_ins: HashMap<InstructionIndex, SymbolId>,

    relocs: HashMap<InstructionIndex, SymbolId>,

    io: IoKind,
    stack: StackKind,
    end: EndKind,
}

impl<T: Write> MachineGen<T> {
    pub fn new(out: T, io: IoKind) -> Self {
        Self {
            asm: out,
            symbol_queue: Vec::new(),
            byte_off: 0,
            io,
            instruction: Vec::new(),
            symbols_ins: HashMap::new(),
            relocs: HashMap::new(),
            symbols: Vec::new(),
            stack: StackKind::Provided,
            end: EndKind::Return,
        }
    }

    pub fn set_stack_kind(mut self, kind: StackKind) -> Self {
        self.stack = kind;
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

impl<T: Write> Visitor for MachineGen<T> {
    fn visit_start(&mut self) {
        match self.end{
            EndKind::Kill => {},
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

        for ins in &self.instruction {
            ins.to_bytes(&mut self.asm).unwrap()
        }
    }

    fn visit_while_start(&mut self, ptr_off: i64) {
        let (start, end) = self.begin_section();
        self.push_instrucion(Instruction::CmpByteMemZero { byte_off: ptr_off as i32 });
        self.push_reloc_instrucion(end, Instruction::Je { byte_off: -2 });
        self.update_symbol_to_current(start);
    }

    fn visit_while_end(&mut self, ptr_off: i64) {
        let (start, end) = self.end_section();
        self.push_instrucion(Instruction::CmpByteMemZero { byte_off: ptr_off as i32 });

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
            self.push_instrucion(Instruction::AddByteMemRbx { byte_off: byte_off as i32, val });
        }
    }

    fn visit_mem_set(&mut self, val: u8, off: i64) {
        self.push_instrucion(Instruction::MoveRbxImmImmByte{byte_off: off as i32, val})
    }

    fn visit_ptr_off(&mut self, byte_off: i64) {
        if byte_off != 0 {
            self.push_instrucion(Instruction::LeaRbxRbx { byte_off: byte_off as i32 });
        }
    }

    fn visit_print(&mut self, byte_off: i64) {
        match self.io {
            IoKind::UserDefinedIO { .. } => {
                self.push_instrucion(Instruction::LeaRdiRbx { byte_off: byte_off as i32 });
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
                self.push_instrucion(Instruction::LeaRsiRbx { byte_off: byte_off  as i32 });
                self.push_instrucion(Instruction::Syscall);
            }
        }
    }

    fn visit_read(&mut self, byte_off: i64) {
        match self.io {
            IoKind::UserDefinedIO { .. } => {
                self.push_instrucion(Instruction::LeaRdiRbx { byte_off: byte_off as i32 });
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
                self.push_instrucion(Instruction::LeaRsiRbx { byte_off: byte_off as i32 });
                self.push_instrucion(Instruction::Syscall);
            }
        }
    }
}
