use std::{io::{Stdin, Write}, process::{Command, Stdio}};

use super::Backend;

pub struct Llvm<W: Write> {
    ir: String,
    out: W,
    settings: super::Settings,
    additional: String,
    overflow: bool,
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
            ir: String::new(),
            out,
            settings,
            additional,
            overflow: true
        }
    }

    fn visit_start(&mut self) {
        self.ir.push_str(r#"
        define void @print(ptr align 1 %str, i64 %len){
            call void asm "syscall", "{rax},{rdi},{rdx},{rsi}"(i64 1, i64 1, i64 %len, ptr align 1 %str)
            ret void
        }
        define void @read(ptr align 1 %str, i64 %len){
            call void asm "syscall", "{rax},{rdi},{rdx},{rsi}"(i64 0, i64 0, i64 %len, ptr align 1 %str)
            ret void
        }
        define void @exit(i32 %code) noreturn nounwind{
            call void asm "syscall", "{rdi},{rax}"(i32 %code, i64 60)
            ret void
        }

        define i32 @_start() {
        "#);
    }

    fn visit_end(&mut self) {
        self.ir.push_str(r#"
            call void @print(ptr align 1 @str.0, i64 13)
            call void @exit(i32 0) noreturn nounwind
            ret i32 0
        }
        @str.0 = internal constant [13 x i8] c"Hello, World\0a"

        "#);
        match self.settings.output{
            super::OutputKind::Asm => {
                let mut opt: std::process::Child = Command::new("opt")
                    .args(["-O3"])
                    .stdout(Stdio::piped())
                    .stdin(Stdio::piped())
                    .spawn()
                    .unwrap();

                if let Some(input) = &mut opt.stdin{
                    input.write_all(self.ir.as_bytes()).unwrap();
                }
                let out = opt.wait_with_output().unwrap();

                let mut comp = Command::new("llc")
                    .args(["-O3", "-filetype=asm"])
                    .stdin(Stdio::piped())
                    .stdout(Stdio::piped())
                    .spawn()
                    .unwrap();
                if let Some(input) = &mut comp.stdin{
                    input.write_all(&out.stdout).unwrap();
                }
                let out = comp.wait_with_output().unwrap();
                self.out.write_all(&out.stdout).unwrap();
            },

            super::OutputKind::Elf => {
                let mut opt: std::process::Child = Command::new("opt")
                    .args(["-O3"])
                    .stdout(Stdio::piped())
                    .stdin(Stdio::piped())
                    .spawn()
                    .unwrap();

                if let Some(input) = &mut opt.stdin{
                    input.write_all(self.ir.as_bytes()).unwrap();
                }
                let out = opt.wait_with_output().unwrap();
                

                // let mut comp = Command::new("llc")
                //     .args(["-O3", "-filetype=obj"])
                //     .stdin(Stdio::piped())
                //     .stdout(Stdio::piped())
                //     .spawn()
                //     .unwrap();

                let mut comp = Command::new("clang")
                    .args([ "-x", "ir", "-O3", "-nostdlib", "-"])
                    .stdin(Stdio::piped())
                    .stdout(Stdio::piped())
                    .spawn()
                    .unwrap();

                // let mut ld = Command::new("ld.lld")
                //     .args(["-lc"])
                //     .stdin(Stdio::piped())
                //     .stdout(Stdio::piped())
                //     .spawn()
                //     .unwrap();
                if let Some(input) = &mut comp.stdin{
                    input.write_all(&out.stdout).unwrap();
                }
                let out = comp.wait_with_output().unwrap();
                self.out.write_all(&out.stdout).unwrap();
            },
            super::OutputKind::Ir => {
                let mut opt: std::process::Child = Command::new("opt")
                    .args(["-O3", "-S"])
                    .stdout(Stdio::piped())
                    .stdin(Stdio::piped())
                    .spawn()
                    .unwrap();

                if let Some(input) = &mut opt.stdin{
                    input.write_all(self.ir.as_bytes()).unwrap();
                }
                let out = opt.wait_with_output().unwrap();
                self.out.write_all(&out.stdout).unwrap();
            },
            super::OutputKind::Binary => {
                todo!()
            },
        }
    }

    fn visit_while_start(&mut self, off: i64) {
        // todo!()
    }

    fn visit_while_end(&mut self, off: i64) {
        // todo!()
    }

    fn visit_mem_off(&mut self, val: u8, off: i64) {
        // todo!()
    }

    fn visit_mem_set(&mut self, val: u8, off: i64) {
        // todo!()
    }

    fn visit_ptr_off(&mut self, off: i64) {
        // todo!()
    }

    fn visit_print(&mut self, off: i64) {
        // todo!()
    }

    fn visit_read(&mut self, off: i64) {
        // todo!()
    }
}
