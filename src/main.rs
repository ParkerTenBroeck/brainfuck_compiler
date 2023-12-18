use std::{io::Write, path::PathBuf, str::FromStr};

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
            let mut file = std::fs::File::create(
                args.output
                    .unwrap_or_else(|| PathBuf::from_str("out.elf").unwrap()),
            )?;
            write_elf(&mut file, &instructions)?;
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

// use std::ffi::bo

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

#[repr(C, packed)]
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

fn write_elf(file: &mut std::fs::File, instructions: &[u8]) -> std::io::Result<()> {
    const PROGRAM_HEADERS: usize = 1;
    const SECTION_HEADERS: usize = 3;
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

    construct_str_table!(mod table{TABLE, _EMPTY:"",TEXT:".text", STRTAB:".strtab"});


    let after_all_headers = std::mem::size_of::<Header>()
        + std::mem::size_of::<ProgramHeader>() * PROGRAM_HEADERS
        + std::mem::size_of::<SectionHeader>() * SECTION_HEADERS;


    let after_str_tab = after_all_headers + table::TABLE.len();

    let aligned_after_str_tab =((after_str_tab as u64 + PROGRAM_ALIGN-1) / PROGRAM_ALIGN) * PROGRAM_ALIGN;


    let programs:[ProgramHeader; PROGRAM_HEADERS] = [ProgramHeader {
        p_type: 1.into(),       // PT_LOAD
        flags: 0x5.into(),      // PT_READ PT_EXECUTE
        file_offset: aligned_after_str_tab.into(), 
        virtual_addr: PROGRAM_START.into(),
        physical_addr: PROGRAM_START.into(),
        file_size: (instructions.len() as u64).into(),
        mem_size: (instructions.len() as u64).into(),
        align: PROGRAM_ALIGN.into(),
    }];

    let sections: [SectionHeader; SECTION_HEADERS] = [
        SectionHeader::default(),
        SectionHeader {
            name_off: (table::STRTAB as u32).into(),
            s_type: 0x3.into(), // zero terminated string
            flags: 0.into(),
            virtual_address: 0.into(),
            file_off: (after_all_headers as u64).into(),
            file_size: (table::TABLE.len() as u64).into(),
            link: 0.into(),
            info: 0.into(),
            addr_align: 1.into(),
            ent_size: 0.into(),
        },
        SectionHeader {
            name_off: (table::TEXT as u32).into(),
            s_type: 1.into(),   // SHT_PROGBITS
            flags: 0.into(),
            virtual_address: PROGRAM_START.into(),
            file_off: (after_str_tab as u64).into(),
            file_size: (instructions.len() as u64).into(),
            link: 0.into(),
            info: 0.into(),
            addr_align: PROGRAM_ALIGN.into(),
            ent_size: 0.into(),
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
        program_header_off: (std::mem::size_of::<Header>() as u64).into(),
        section_header_off: ((std::mem::size_of::<Header>()
            + std::mem::size_of::<ProgramHeader>() * PROGRAM_HEADERS)
            as u64)
            .into(),
        flags: 0.into(),
        header_size: (std::mem::size_of::<Header>() as u16).into(),
        program_header_size: (std::mem::size_of::<ProgramHeader>() as u16).into(),
        program_header_num: (PROGRAM_HEADERS as u16).into(),
        section_header_size: (std::mem::size_of::<SectionHeader>() as u16).into(),
        section_header_num: (SECTION_HEADERS as u16).into(),
        index_section_header_names: 1.into(),
    };

    file.write_all(&unsafe{std::mem::transmute::<Header, [u8; std::mem::size_of::<Header>()]>(header)})?;

    for ph in programs{
        file.write_all(&unsafe{std::mem::transmute::<ProgramHeader, [u8; std::mem::size_of::<ProgramHeader>()]>(ph)})?;
    }

    for section in sections{
        file.write_all(&unsafe{std::mem::transmute::<SectionHeader, [u8; std::mem::size_of::<SectionHeader>()]>(section)})?;
    }

    file.write_all(table::TABLE.as_bytes())?;

    for _ in (after_str_tab as u64)..aligned_after_str_tab{
        file.write_all(&[0])?;
    }

    file.write_all(&instructions)
}
