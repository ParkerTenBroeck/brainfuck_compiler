use std::io::Write;

use super::Backend;

pub struct Llvm<W: Write> {
    out: W,
    settings: super::Settings,
    additional: String,
}

impl<W: Write> Llvm<W>{
    fn write_cell_type(&mut self) {
        match self.settings.cell_size{
            super::CellSize::C1 => self.out.write("i8".as_bytes()).unwrap(),
            super::CellSize::C2 => self.out.write("i16".as_bytes()).unwrap(),
            super::CellSize::C4 => self.out.write("i32".as_bytes()).unwrap(),
        };
    }
}

impl<W: Write> Backend<W> for Llvm<W> {
    fn new(out: W, settings: super::Settings, additional: String) -> Self {
        Self {
            out,
            settings,
            additional,
        }
    }

    fn visit_start(&mut self) {
        todo!()
    }

    fn visit_end(&mut self) {
        todo!()
    }

    fn visit_while_start(&mut self, off: i64) {
        todo!()
    }

    fn visit_while_end(&mut self, off: i64) {
        todo!()
    }

    fn visit_mem_off(&mut self, val: u8, off: i64) {
        todo!()
    }

    fn visit_mem_set(&mut self, val: u8, off: i64) {
        todo!()
    }

    fn visit_ptr_off(&mut self, off: i64) {
        todo!()
    }

    fn visit_print(&mut self, off: i64) {
        todo!()
    }

    fn visit_read(&mut self, off: i64) {
        todo!()
    }
}
