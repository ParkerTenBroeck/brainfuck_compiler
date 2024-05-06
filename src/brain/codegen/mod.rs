use std::io::Write;

use clap::{Parser, ValueEnum};

use super::stages::Ir;

pub mod custom;
pub mod llvm;

#[derive(Copy, Clone, Parser, Debug, ValueEnum, PartialEq, Eq)]
pub enum OutputKind {
    Asm,
    Ir,
    Binary,
    Elf,
}

impl std::fmt::Display for OutputKind {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            OutputKind::Elf => write!(f, "elf"),
            OutputKind::Binary => write!(f, "binary"),
            OutputKind::Asm => write!(f, "asm"),
            OutputKind::Ir => write!(f, "ir"),
        }
    }
}

#[derive(Copy, Clone, Parser, Debug, ValueEnum, Eq, PartialEq)]
pub enum CellSize {
    C1,
    C2,
    C4,
}

impl std::fmt::Display for CellSize {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            CellSize::C1 => write!(f, "c1"),
            CellSize::C2 => write!(f, "c2"),
            CellSize::C4 => write!(f, "c4"),
        }
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct Settings {
    pub output: OutputKind,
    pub stacksize: u64,
    pub cell_size: CellSize,
    pub opt_level: u8,
}

pub trait Backend<W: Write>: Sized {
    fn new(out: W, settings: Settings, additional: String) -> Self;
    fn visit_start(&mut self);
    fn visit_end(&mut self);

    fn visit_while_start(&mut self, off: i64);
    fn visit_while_end(&mut self, off: i64);

    fn visit_mem_off(&mut self, val: u8, off: i64);
    fn visit_mem_set(&mut self, val: u8, off: i64);
    fn visit_ptr_off(&mut self, off: i64);
    fn visit_print(&mut self, off: i64);
    fn visit_read(&mut self, off: i64);

    fn visit(&mut self, code: &Vec<Ir>) {
        visit_all(self, code);
    }
}

pub fn visit_all<W: Write>(visiter: &mut impl Backend<W>, code: &Vec<Ir>) {
    visiter.visit_start();
    for terminal in code {
        visit_terminal(terminal, visiter);
    }
    visiter.visit_end();
}

fn visit_all_1<W: Write>(code: &Vec<Ir>, visiter: &mut impl Backend<W>) {
    for terminal in code {
        visit_terminal(terminal, visiter);
    }
}

fn visit_terminal<W: Write>(term: &Ir, visiter: &mut impl Backend<W>) {
    match term {
        Ir::While { inside, ptr_off } => {
            visiter.visit_while_start(*ptr_off);
            visit_all_1(inside, visiter);
            visiter.visit_while_end(*ptr_off);
        }
        Ir::OffsetValue { val_off, ptr_off } => visiter.visit_mem_off(*val_off, *ptr_off),
        Ir::OffsetPtr { ptr_off } => visiter.visit_ptr_off(*ptr_off),
        Ir::Print { ptr_off } => visiter.visit_print(*ptr_off),
        Ir::Input { ptr_off } => visiter.visit_read(*ptr_off),
        Ir::Set { ptr_off, val } => visiter.visit_mem_set(*val, *ptr_off),
    }
}
