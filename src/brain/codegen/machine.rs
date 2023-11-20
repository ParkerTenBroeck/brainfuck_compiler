use std::{io::Write, collections::HashMap};

use crate::brain::visitor::Visitor;


enum Instruction {
    Call{ byte_off: isize },
    MovR11 { abs_addr: usize },
    MovRbxRdi,
    JmpR11,
    AddByteMemRbx { byte_off: isize, val: u8 },
    LeaRbxRbx { byte_off: isize },
    LeaRdiRbx { byte_off: isize },
    Je{ byte_off: isize },
    Jne{ byte_off: isize },
    CmpByteMemZero { byte_off: isize },
    Ret,
    Jmp { byte_off: isize },
}

impl Instruction {
    pub fn size(&self) -> usize {
        match self {
            Instruction::Call{ .. } => 5,
            Instruction::MovR11 { .. } => 10,
            Instruction::MovRbxRdi => 3,
            Instruction::JmpR11 => 3,
            Instruction::AddByteMemRbx { byte_off, .. } => {
                if *byte_off == 0 {
                    3
                }else if *byte_off < -128 || *byte_off > 127 {
                    7
                } else {
                    4
                }
            }
            Instruction::LeaRbxRbx { byte_off } => {
                if *byte_off == 0 {
                    3
                }else if *byte_off < -128 || *byte_off > 127 {
                    7
                } else {
                    4
                }
            }
            Instruction::LeaRdiRbx { byte_off } => {
                if *byte_off == 0 {
                    3
                }else if *byte_off < -128 || *byte_off > 127 {
                    7
                } else {
                    4
                }
            }
            Instruction::Je{ byte_off } => {
                if *byte_off < -128 || *byte_off > 127 {
                    6
                } else {
                    2
                }
            }
            Instruction::Jne{ byte_off } => {
                if *byte_off < -128 || *byte_off > 127 {
                    6
                } else {
                    2
                }
            }
            Instruction::CmpByteMemZero { byte_off } => {
                if *byte_off < -128 || *byte_off > 127 {
                    7
                } else if *byte_off == 0 {
                    3
                }else{
                    4
                }
            }
            Instruction::Ret => 1,
            Instruction::Jmp { byte_off } => if (-128..128).contains(byte_off){
                2
            }else{
                5
            },
        }
    }

    pub fn to_bytes(&self, out: &mut impl std::io::Write) -> std::io::Result<()>{
        match self{
            Instruction::Call{ byte_off } => {
                out.write_all(&[0xe8])?;
                out.write_all(&(*byte_off as i32).to_le_bytes())
            },
            Instruction::MovR11 { abs_addr } => {
                out.write_all(&[0x49, 0xbb])?;
                out.write_all(&(*abs_addr as i64).to_le_bytes())
            },
            Instruction::MovRbxRdi => {
                out.write_all(&[0x48, 0x89, 0xfb])
            },
            Instruction::JmpR11 => {
                out.write_all(&[0x41, 0xff, 0xe3])
            },
            Instruction::AddByteMemRbx { byte_off, val } => {
                if *byte_off == 0{
                    out.write_all(&[0x80, 0x03])?;
                    out.write_all(&[*val])
                }else if (-128..128).contains(byte_off){
                    out.write_all(&[0x80, 0x43])?;
                    out.write_all(&(*byte_off as i8).to_le_bytes())?;
                    out.write_all(&[*val])
                }else{
                    out.write_all(&[0x80, 0x83])?;
                    out.write_all(&(*byte_off as i32).to_le_bytes())?;
                    out.write_all(&[*val])
                }
            },
            Instruction::LeaRbxRbx { byte_off } => if *byte_off == 0{
                out.write_all(&[0x48, 0x8d, 0x1b])
            }else if (-128..128).contains(byte_off){
                out.write_all(&[0x48, 0x8d, 0x5b])?;
                out.write_all(&(*byte_off as i8).to_le_bytes())
            }else{
                out.write_all(&[0x48, 0x8d, 0x9b])?;
                out.write_all(&(*byte_off as i32).to_le_bytes())
            },
            Instruction::LeaRdiRbx { byte_off } => if *byte_off == 0{
                out.write_all(&[0x48, 0x8d, 0x3b])
            }else if (-128..128).contains(byte_off){
                out.write_all(&[0x48, 0x8d, 0x7b])?;
                out.write_all(&(*byte_off as i8).to_le_bytes())
            }else{
                out.write_all(&[0x48, 0x8d, 0xbb])?;
                out.write_all(&(*byte_off as i32).to_le_bytes())
            },
            Instruction::Je { byte_off } => if (-128..128).contains(byte_off){
                out.write_all(&[0x74])?;
                out.write_all(&(*byte_off as i8).to_le_bytes())
            }else{
                out.write_all(&[0x0f, 0x84])?;
                out.write_all(&(*byte_off as i32).to_le_bytes())
            },
            Instruction::Jne { byte_off } => if (-128..128).contains(byte_off){
                out.write_all(&[0x75])?;
                out.write_all(&(*byte_off as i8).to_le_bytes())
            }else{
                out.write_all(&[0x0f, 0x85])?;
                out.write_all(&(*byte_off as i32).to_le_bytes())
            },
            Instruction::CmpByteMemZero { byte_off } => if *byte_off == 0{
                out.write_all(&[0x80, 0x3b, 0x00])
            }else if (-128..128).contains(byte_off){
                out.write_all(&[0x80, 0x7b])?;
                out.write_all(&(*byte_off as i8).to_le_bytes())?;
                out.write_all(&[0x00])
            }else{
                out.write_all(&[0x80, 0xbb, 0xbb])?;
                out.write_all(&(*byte_off as i32).to_le_bytes())?;
                out.write_all(&[0x00])
            },
            Instruction::Ret => out.write_all(&[0xc3]),
            Instruction::Jmp { byte_off } => if (-128..128).contains(byte_off){
                out.write_all(&[0xeb])?;
                out.write_all(&(*byte_off as i8).to_le_bytes())
            }else{
                out.write_all(&[0xe9])?;
                out.write_all(&(*byte_off as i32).to_le_bytes())
            },
        }
    }

    fn reloc(&mut self, start_inst: usize, to: usize) {
        match self{
            Self::Je { byte_off } => {
                *byte_off = to as isize - (start_inst as isize + 2);
                if !(-128..128).contains(byte_off){
                    *byte_off -= 3;
                }
            }
            Self::Jmp { byte_off } | Self::Jne { byte_off } => {
                *byte_off = to as isize - (start_inst as isize + 2);
                if !(-128..128).contains(byte_off){
                    *byte_off -= 4;
                }
            }
            Self::Call { byte_off } => {
                *byte_off = to as isize - (start_inst as isize + 5);
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
struct Symbol{
    byte_off: usize,
    instruction_off: usize,
}

pub struct MachineGen<T: Write> {
    asm: T,
    instruction: Vec<Instruction>,
    byte_off: usize,
    symbol_queue: Vec<SymbolId>,
    
    symbols: Vec<Symbol>,
    symbols_ins: HashMap<InstructionIndex, SymbolId>,

    relocs: HashMap<InstructionIndex, SymbolId>,
    print: extern "C" fn(&u8),
    read: extern "C" fn(&mut u8),
}

impl<T: Write> MachineGen<T> {
    pub fn new(out: T, print: extern "C" fn(&u8), read: extern "C" fn (&mut u8)) -> Self {
        Self {
            asm: out,
            symbol_queue: Vec::new(),
            byte_off: 0,
            print,
            read,
            instruction: Vec::new(),
            symbols_ins: HashMap::new(),
            relocs: HashMap::new(),
            symbols: Vec::new(),
        }
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
        self.relocs.insert(InstructionIndex(self.instruction.len()), symbol);
        self.push_instrucion(inst);
    }

    fn push_symbol(&mut self) -> SymbolId {
        self.symbols.push(Symbol { byte_off: self.byte_off, instruction_off: self.instruction.len() });
        SymbolId(self.symbols.len() - 1)
    }

    fn push_instrucion(&mut self, instruction: Instruction) {
        self.byte_off += instruction.size();
        self.instruction.push(instruction);
    }

    fn update_symbol_to_current(&mut self, start: SymbolId) {
        self.symbols[start.0].instruction_off = self.instruction.len();
        self.symbols_ins.insert(InstructionIndex(self.instruction.len()), start);
        self.symbols[start.0].byte_off = self.byte_off;
    }
}

impl<T: Write> Visitor for MachineGen<T> {
    fn visit_start(&mut self) {
        self.push_instrucion(Instruction::MovRbxRdi);

        // known offset from known instruction
        self.push_instrucion(Instruction::Jmp{ byte_off: 0x1a });

        self.push_symbol();
        self.push_instrucion(Instruction::MovR11 { abs_addr: self.print as *const() as usize });
        self.push_instrucion(Instruction::JmpR11);

        self.push_symbol();
        self.push_instrucion(Instruction::MovR11 { abs_addr: self.read as *const() as usize });
        self.push_instrucion(Instruction::JmpR11);        
    }

    fn visit_end(&mut self) {
        self.instruction.push(Instruction::Ret);

        let mut changed = false;
        loop{
            let mut current_byte = 0;
            for (index, inst) in self.instruction.iter_mut().enumerate(){
                if let Some(index) = self.symbols_ins.get(&InstructionIndex(index)){
                    if current_byte != self.symbols[index.0].byte_off{
                        changed = true;
                        self.symbols[index.0].byte_off = current_byte;
                    }
                }
                if let Some(symbol) = self.relocs.get(&InstructionIndex(index)){
                    let to = self.symbols[symbol.0].byte_off;
                    inst.reloc(current_byte, to);
                }
                current_byte += inst.size();
            }

            if !changed{
                break;
            }
        }
    
        for ins in &self.instruction{
            ins.to_bytes(&mut self.asm).unwrap()
        }
    }

    fn visit_while_start(&mut self) {
        let (start, end) = self.begin_section();
        self.push_instrucion(Instruction::CmpByteMemZero { byte_off: 0 });
        self.push_reloc_instrucion(end, Instruction::Je { byte_off: -2 });
        self.update_symbol_to_current(start);
    }

    fn visit_while_end(&mut self) {
        let (start, end) = self.end_section();
        self.push_instrucion(Instruction::CmpByteMemZero { byte_off: 0 });

        let wanted = self.symbols[start.0].byte_off as isize;
        let mut current = (self.byte_off + 2) as isize;
        if !(-128..127).contains(&current){
            current += 3;
        }

        self.push_reloc_instrucion(start, Instruction::Jne { byte_off: current - wanted });
        self.update_symbol_to_current(end);
    }

    fn visit_mem_off(&mut self, val: u8, byte_off: isize) {
        if val != 0{
            self.push_instrucion(Instruction::AddByteMemRbx { byte_off, val });
        }
    }

    fn visit_ptr_off(&mut self, byte_off: isize) {
        if byte_off != 0 {
            self.push_instrucion(Instruction::LeaRbxRbx { byte_off });
        }
    }

    fn visit_print(&mut self, byte_off: isize) {
        self.push_instrucion(Instruction::LeaRdiRbx { byte_off });
        let wanted = self.symbols[0].byte_off as isize;
        let current = (self.byte_off + 5) as isize;
        self.push_reloc_instrucion(SymbolId(0), Instruction::Call { byte_off: current - wanted });
    }

    fn visit_read(&mut self, byte_off: isize) {
        self.push_instrucion(Instruction::LeaRdiRbx { byte_off });
        let wanted = self.symbols[1].byte_off as isize;
        let current = (self.byte_off + 5) as isize;
        self.push_reloc_instrucion(SymbolId(1), Instruction::Call { byte_off: current - wanted });
    }
}
