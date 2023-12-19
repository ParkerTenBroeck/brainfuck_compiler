
use std::{io::{Write, BufWriter}, path::PathBuf, str::FromStr};

use crate::brain::{codegen, interpret};

mod bf_programs;
mod brain;

struct TimerScope {
    name: String,
    childern: Vec<TimerScope>,
    duration: std::time::Duration,
}

impl TimerScope {
    pub fn start(name: impl ToString, timed: impl FnOnce(&mut Self)) -> Self {
        let mut new = TimerScope {
            name: name.to_string(),
            childern: Vec::new(),
            duration: std::time::Duration::from_micros(0),
        };
        let start = std::time::Instant::now();
        timed(&mut new);
        new.duration = start.elapsed();
        new
    }
    pub fn named<T>(&mut self, name: impl ToString, timed: impl FnOnce(&mut Self) -> T) -> T {
        let mut new = TimerScope {
            name: name.to_string(),
            childern: Vec::new(),
            duration: std::time::Duration::from_micros(0),
        };
        let start = std::time::Instant::now();
        let ret = timed(&mut new);
        new.duration = start.elapsed();
        self.childern.push(new);
        ret
    }

    fn to_string_r(&self, left: &mut String, append: &mut String) {
        use std::fmt::Write;

        if left.is_empty() {
            writeln!(
                append,
                "{}:\t{:.4}ms",
                self.name,
                self.duration.as_secs_f64() * 1000.0
            )
            .unwrap();
        }

        let vals = [0u8; 10];
        vals.into_iter().position(|x| x == 0).unwrap_or(80);

        for (index, child) in self.childern.iter().enumerate() {
            let last = index == self.childern.len() - 1;

            // left.push_str("┃ ");
            // writeln!(append, "{}", left).unwrap();
            // left.pop();
            // left.pop();

            left.push_str(if last { "┗━" } else { "┣━" });
            append.push_str(&left);
            writeln!(
                append,
                "{}:\t{:.4}ms",
                child.name,
                child.duration.as_secs_f64() * 1000.0
            )
            .unwrap();
            left.pop();
            left.pop();

            left.push_str(if last { "  " } else { "┃ " });
            child.to_string_r(left, append);
            left.pop();
            left.pop();
        }
    }
}

impl std::string::ToString for TimerScope {
    fn to_string(&self) -> String {
        let mut string = String::new();
        self.to_string_r(&mut String::new(), &mut string);
        string
    }
}

use clap::*;

#[derive(Copy, Clone, Parser, Debug, ValueEnum, PartialEq, Eq)]
enum OutputKind {
    Elf,
    Binary,
    Asm,
}

impl std::fmt::Display for OutputKind {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            OutputKind::Elf => write!(f, "elf"),
            OutputKind::Binary => write!(f, "binary"),
            OutputKind::Asm => write!(f, "asm"),
        }
    }
}

#[derive(Copy, Clone, Parser, Debug, ValueEnum, Eq, PartialEq)]
enum RunKind {
    Stage1,
    Stage2,
    Stage3,
    Binary,
}

impl std::fmt::Display for RunKind {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            RunKind::Binary => write!(f, "binary"),
            RunKind::Stage1 => write!(f, "stage1"),
            RunKind::Stage2 => write!(f, "stage2"),
            RunKind::Stage3 => write!(f, "stage3"),
        }
    }
}

/// Brain fuck compiler
#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    /// Bf program to compile
    #[arg(short, long)]
    input: PathBuf,

    /// output filename [default: 'out']
    #[arg(short, long)]
    output: Option<PathBuf>,

    /// output format
    #[arg(long, default_value_t = OutputKind::Elf)]
    output_fmt: OutputKind,

    /// The level of optimization to perform [values: 1, 2, 3]
    #[arg(long, default_value_t = 0, value_parser = clap::value_parser!(u8).range(0..=3))]
    opt_level: u8,

    /// instead of outputing the compiled result run it (and time it)
    #[arg(long)]
    run: Option<RunKind>,

    /// the size in bytes of the stack to be used
    #[arg(short, long, default_value_t = 0x1000)]
    stack_size: u64,
}

fn main() -> std::io::Result<()> {
    let args = Args::parse();
    use crate::brain::parser::Brain;

    let program = std::fs::read_to_string(args.input)?;

    let stage1 = if args.opt_level >= 1 {
        Brain::new(&program).parse()
    } else {
        Brain::new(&program).parse_bad()
    };
    if args.run == Some(RunKind::Stage1) {
        interpret::BrainInterpret::new().interpret(&stage1);
        return Ok(());
    }

    let stage2 = if args.opt_level >= 2 {
        brain::ast_to_ir::ast_to_ir(&stage1)
    } else {
        brain::ast_to_ir::ast_to_ir_direct(&stage1)
    };

    if args.run == Some(RunKind::Stage2) {
        interpret::BrainInterpretIr::new().interpret(&stage2);
        return Ok(());
    }

    let io = if args.run == Some(RunKind::Binary) {
        extern "C" fn print(char: &u8) {
            _ = std::io::Write::write_all(&mut std::io::stdout().lock(), &[*char]);
        }
        extern "C" fn read(char: &mut u8) {
            let bruh = std::io::Read::bytes(std::io::stdin())
                .next()
                .and_then(|result| result.ok())
                .unwrap_or(0);
            *char = bruh;
        }
        codegen::machine::IoKind::UserDefinedIO {
            print: print,
            read: read,
        }
    } else {
        codegen::machine::IoKind::PreDefinedIO
    };

    let end_kind = if args.run == Some(RunKind::Binary) {
        codegen::machine::EndKind::Return
    } else if args.output_fmt == OutputKind::Elf {
        codegen::machine::EndKind::Kill
    } else {
        codegen::machine::EndKind::Return
    };

    let stack = codegen::machine::StackKind::CreateN(args.stack_size);

    if args.run == None && args.output_fmt == OutputKind::Asm {
        let mut file = std::fs::File::create(
            args.output
                .unwrap_or_else(|| PathBuf::from_str("out.asm").unwrap()),
        )?;
        let mut visiter = codegen::assembly::AsmCodeGen::new(&mut file);
        brain::visitor::visit_all(&stage2, &mut visiter);
        return Ok(());
    }

    let mut instructions = Vec::new();
    let mut visiter = codegen::machine::MachineGen::new(&mut instructions, io)
        .set_end_kind(end_kind)
        .set_stack_kind(stack);
    brain::visitor::visit_all(&stage2, &mut visiter);

    if args.run == Some(RunKind::Binary) {
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

        unsafe {
            std::ptr::copy(instructions.as_ptr(), map.data(), instructions.len());
        }
        let func: extern "C" fn() = unsafe { std::mem::transmute(map.data()) };

        func();
        return Ok(());
    }

    match args.output_fmt {
        OutputKind::Elf => {
            let file = std::fs::File::create(
                args.output
                    .unwrap_or_else(|| PathBuf::from_str("out.elf").unwrap()),
            )?;
            write_elf(&mut BufWriter::new(file), &instructions)?;
        }
        OutputKind::Binary => {
            let mut file = std::fs::File::create(
                args.output
                    .unwrap_or_else(|| PathBuf::from_str("out.bin").unwrap()),
            )?;
            file.write_all(&instructions)?
        }
        OutputKind::Asm => unreachable!(),
    }

    Ok(())
}



trait ReprBytes: Sized{
    fn repr_bytes<'a>(&'a self) -> &'a [u8]{
        unsafe{
            std::slice::from_raw_parts(self as *const Self as *const u8, std::mem::size_of::<Self>())
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

        impl ReprBytes for $type{
            fn repr_bytes(&self) -> &[u8]{
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

impl ReprBytes for Header{}

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
impl ReprBytes for ProgramHeader{}

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

impl ReprBytes for SectionHeader{}

#[repr(C, packed)]
#[derive(Default)]
struct SymbolTableEntry{
    name: U32LE,
    info: U8LE,
    other: U8LE,
    section_index: U16LE,
    addr: USizeLE,
    sym_size: USizeLE
}

impl ReprBytes for SymbolTableEntry{}

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
    let program_header_start =  elf_header_start + std::mem::size_of::<Header>();
    let section_header_start = program_header_start
        + std::mem::size_of::<ProgramHeader>() * PROGRAM_HEADERS;
    let str_table_start = section_header_start
        + std::mem::size_of::<SectionHeader>() * SECTION_HEADERS;

    let symbol_table_start = str_table_start + str_table::TABLE.len();

    let program_start_unaligned = symbol_table_start 
        + std::mem::size_of::<SymbolTableEntry>() * SYMBOLS;

    let program_start_file =((program_start_unaligned as u64 + PROGRAM_ALIGN-1) / PROGRAM_ALIGN) * PROGRAM_ALIGN;

    let programs:[ProgramHeader; PROGRAM_HEADERS] = [
        ProgramHeader {
        p_type: 1.into(),       // PT_LOAD
        flags: 0x5.into(),      // PT_READ PT_EXECUTE
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
            s_type: 1.into(),   // SHT_PROGBITS
            flags: 6.into(),    // flags A(allocate in image?) X(exacutable?)
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
        SymbolTableEntry{
            name: (str_table::START as u32).into(),
            info: (0x12).into(),     //global function
            other: 0.into(),    // default
            section_index: 3.into(),    //program section 
            addr: PROGRAM_START.into(),
            sym_size: (instructions.len() as u64).into(),
        }
    ];

    let header = Header {
        magic: [0x7f, 0x45, 0x4c, 0x46],
        class: 2.into(),   // 64 bit
        data: 1.into(),    // le
        version: 1.into(), //version 1
        osabi: 9.into(),   // system-v(0) freebsd(9)
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

    for ph in &programs{
        file.write_all(ph.repr_bytes())?;
    }

    for section in &sections{
        file.write_all(section.repr_bytes())?;
    }

    file.write_all(str_table::TABLE.as_bytes())?;

    for symbol in &symbols{
        file.write_all(symbol.repr_bytes())?;
    }

    // alignment
    for _ in program_start_unaligned..(program_start_file as usize){
        file.write_all(&[0])?;
    }

    file.write_all(&instructions)
}
