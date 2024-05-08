use std::{io::BufWriter, path::PathBuf, str::FromStr};

use crate::brain::{
    interpret::BfInterpreter,
    parse::BfParser,
    stages::{stage1::Stage1, stage2::Stage2, Stage},
};

mod bf_programs;
mod brain;

use brain::codegen::{custom::MachineGen, llvm::Llvm, Backend, CellSize, OutputKind, Settings};
use clap::{Parser, *};

#[derive(Copy, Clone, Parser, Debug, ValueEnum, PartialEq, Eq)]
enum BackendKind {
    Custom,
    Llvm,
}

impl std::fmt::Display for BackendKind {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            BackendKind::Custom => write!(f, "custom"),
            BackendKind::Llvm => write!(f, "llvm"),
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

    /// the backend to generate the binary / assembly
    #[arg(long, default_value_t = BackendKind::Custom)]
    backend: BackendKind,

    /// The level of optimization to perform [values: 1, 2, 3]
    #[arg(long, default_value_t = 0, value_parser = clap::value_parser!(u8).range(0..=3))]
    opt_level: u8,

    /// interpret the IR
    #[arg(long)]
    run: bool,

    /// the size in bytes of the stack to be used
    #[arg(short, long, default_value_t = 0x1000)]
    stack_size: u64,

    /// the size in bytes of the stack to be used
    #[arg(short, long, default_value_t = CellSize::C1)]
    cell_size: CellSize,
}

fn main() -> std::io::Result<()> {
    let args = Args::parse();

    let program = std::fs::read_to_string(args.input)?;

    let mut ir = BfParser::new(&program).parse_good();

    if args.opt_level >= 1 {
        ir = Stage1.apply(&mut ir)
    }

    if args.opt_level >= 2 {
        ir = Stage2.apply(&mut ir);
    };

    if args.opt_level >= 3 {
        todo!()
        // ir = Stage3.apply(&mut ir);
    };

    if args.run {
        BfInterpreter::new().interpret(&ir);
        return Ok(());
    }

    let default = match args.output_fmt {
        OutputKind::Elf => "out",
        OutputKind::Binary => "out.bin",
        OutputKind::Asm => "out.asm",
        OutputKind::Ir => "out.ll",
    };

    let file = std::fs::File::create(
        args.output
            .unwrap_or_else(|| PathBuf::from_str(default).unwrap()),
    )?;

    let out = BufWriter::new(file);

    let settings = Settings {
        output: args.output_fmt,
        stacksize: args.stack_size,
        cell_size: args.cell_size,
        opt_level: args.opt_level,
    };

    match args.backend {
        BackendKind::Custom => {
            MachineGen::new(out, settings, String::new()).visit(&ir);
        }
        BackendKind::Llvm => {
            Llvm::new(out, settings, String::new()).visit(&ir);
        }
    }

    Ok(())
}
