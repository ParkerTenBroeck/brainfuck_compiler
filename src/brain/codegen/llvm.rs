use std::{
    io::{Stdin, Write},
    process::{Command, Stdio},
};

use super::Backend;

pub struct Llvm<W: Write> {
    ir: String,
    out: W,
    settings: super::Settings,
    additional: String,
    overflow: bool,
    next_loop: usize,
    stack: Vec<usize>
}

impl<W: Write> Llvm<W> {
    fn cell_type(&mut self) -> &'static str {
        match self.settings.cell_size {
            super::CellSize::C1 => "i8",
            super::CellSize::C2 => "i16",
            super::CellSize::C4 => "i32",
        }
    }

    fn cell_align(&mut self) -> usize {
        match self.settings.cell_size {
            super::CellSize::C1 => std::mem::align_of::<i8>(),
            super::CellSize::C2 => std::mem::align_of::<i16>(),
            super::CellSize::C4 => std::mem::align_of::<i32>(),
        }
    }
}

impl<W: Write> Backend<W> for Llvm<W> {
    fn new(out: W, settings: super::Settings, additional: String) -> Self {
        Self {
            ir: String::new(),
            out,
            settings,
            additional,
            overflow: true,
            next_loop: 0,
            stack: Vec::new(),
        }
    }

    fn visit_start(&mut self) {
        use std::fmt::Write;
        let cell_type = self.cell_type();
        let ptr_align = self.cell_align();
        let stack_size = self.settings.stacksize;
        let stack_size_m1 = self.settings.stacksize - 1;
        let nsw = if self.overflow { "nsw" } else { "" };

        let ptr_type = format!("ptr noalias nocapture noundef nonnull align {ptr_align}");

        writeln!(self.ir, r#"
@tape = internal global <{{ [{stack_size} x {cell_type}] }}> zeroinitializer, align {ptr_align}
@tape_start = local_unnamed_addr constant <{{ ptr }}> <{{ptr @tape}}>, align 8
@tape_end = local_unnamed_addr constant <{{ ptr }}> <{{ptr getelementptr inbounds ({cell_type}, ptr @tape, i64 {stack_size_m1})}}>, align 8

@str.0 = internal constant [13 x i8] c"Hello, World\0a"
@str.1 = internal constant [7 x i8] c"Panic!\0a"

define private i32 @print({ptr_type} %str, i64 %len) nounwind {{
    %r = call i32 asm sideeffect "syscall", "={{rax}},{{rax}},{{rdi}},{{rdx}},{{rsi}}"(i64 1, i64 1, i64 %len, ptr align 1 %str)
    ret i32 %r
}}
define private i32 @read({ptr_type} %str, i64 %len) nounwind {{
    %r = call i32 asm sideeffect "syscall", "={{rax}},{{rax}},{{rdi}},{{rdx}},{{rsi}}"(i64 0, i64 0, i64 %len, ptr align 1 %str)
    ret i32 %r
}}
define void @exit(i64 %code) noreturn nounwind{{
    call void asm sideeffect "syscall", "{{rdi}},{{rax}}"(i64 %code, i64 60)
    unreachable
    ret void
}}

define private ptr @verify_tape_ptr({ptr_type} %ptr) {{
    start:
        %tape_ptr_start = load ptr, ptr @tape_start, align 8
        %tape_ptr_end = load ptr, ptr @tape_end, align 8
        
        %lower = icmp uge ptr %ptr,  %tape_ptr_start
        br i1 %lower, label %good.0, label %poison
    good.0:
        %upper = icmp ule ptr %ptr, %tape_ptr_end
        br i1 %upper, label %good.1, label %poison
    good.1:
        ret ptr %ptr
    poison:
        call void @print(ptr @str.1, i64 7)
        ret ptr poison
}}

define private ptr @get_offset_tape({ptr_type} %ptr, i64 %off) unnamed_addr  {{
    %p.before = load ptr, ptr %ptr
    %p.add = getelementptr {cell_type}, ptr %p.before, i64 %off
    %p.after = tail call ptr @verify_tape_ptr(ptr %p.add)
    ret ptr %p.after
}}

define private void @print_from_tape_off({ptr_type} %ptr, i64 %off) unnamed_addr  {{
    %po = call ptr @get_offset_tape(ptr %ptr, i64 %off)
    tail call void @print(ptr %po, i64 1)
    ret void
}}

define private void @read_into_tape_off({ptr_type} %ptr, i64 %off) unnamed_addr {{
    %po = call ptr @get_offset_tape(ptr %ptr, i64 %off)
    tail call void @read(ptr %po, i64 1)
    ret void
}}

define private void @offset_tape_head({ptr_type} %ptr, i64 %off) unnamed_addr {{
    %po = call ptr @get_offset_tape(ptr %ptr, i64 %off)
    store ptr %po, ptr %ptr
    ret void
}}

define private void @set_tape_val({ptr_type} %ptr, i64 %off, {cell_type} %val) unnamed_addr {{
    %po = call ptr @get_offset_tape(ptr %ptr, i64 %off)

    store {cell_type} %val, ptr %po

    ret void 
}}

define private void @offset_tape_val(ptr nocapture noalias align {ptr_align} %ptr, i64 %off, {cell_type} %val) unnamed_addr {{  
    %po = call ptr @get_offset_tape(ptr %ptr, i64 %off)

    %val.before = load {cell_type}, ptr %po
    %val.after = add {nsw} {cell_type} %val.before, %val
    store {cell_type} %val.after, ptr %po 

    ret void
}}

define private i1 @calculate_tape_off_cond({ptr_type} %ptr, i64 %off) unnamed_addr {{
    %po = call ptr @get_offset_tape(ptr %ptr, i64 %off)

    %val = load {cell_type}, ptr %po

    %res = icmp ne {cell_type} %val, 0

    ret i1 %res
}}

define void @_start() unnamed_addr {{
    start:
    %tape_position = alloca ptr
    store ptr @tape, ptr %tape_position
"#).unwrap();

        // write!(self.ir, "call void @llvm.memset.inline.p0.i64()").unwrap();
    }

    fn visit_end(&mut self) {
        self.ir.push_str(
            r#"
    ; %r = call i32 @read(ptr align 1 @tape, i64 200)
    ; %read = sext i32 %r to i64

    ; %tape_ptr_start = load ptr, ptr @tape_start
    ; %tape_ptr_end = load ptr, ptr @tape_end
    
    ;call void @tape_ptr_set(ptr align 1 %tape_ptr, i8 65)
    ;call void @ptr_add(ptr align 1 %tape_ptr, i64 1)
    ;call void @tape_ptr_set(ptr align 1 %tape_ptr, i8 66)

    ;call void @offset_tape_head(ptr %tape_position, i64 1)

    ;call void @set_tape_val(ptr %tape_position, i64 0, i8 65)
    ;call void @set_tape_val(ptr %tape_position, i64 1, i8 66)
    ;call void @set_tape_val(ptr %tape_position, i64 2, i8 67)
    ;call void @set_tape_val(ptr %tape_position, i64 3, i8 68)
    ;call void @set_tape_val(ptr %tape_position, i64 4, i8 69)
    ;call void @set_tape_val(ptr %tape_position, i64 -1, i8 69)
    ;call i32 @print(ptr @tape, i64 4)
    ;call void @print_from_tape_off(ptr %tape_position, i64 0)
    ;call void @print_from_tape_off(ptr %tape_position, i64 1)
    ;call void @print_from_tape_off(ptr %tape_position, i64 2)
    
    ;call i32 @print(ptr align 1 @str.0, i64 13)


    call void @exit(i32 0)
    unreachable
    ret void
}
"#,
        );
        match self.settings.output {
            super::OutputKind::Asm => {
                let mut opt: std::process::Child = Command::new("opt")
                    .args(["-O3"])
                    .stdout(Stdio::piped())
                    .stdin(Stdio::piped())
                    .spawn()
                    .unwrap();

                if let Some(input) = &mut opt.stdin {
                    input.write_all(self.ir.as_bytes()).unwrap();
                }
                let out = opt.wait_with_output().unwrap();

                let mut comp = Command::new("llc")
                    .args(["-O3", "-filetype=asm"])
                    .stdin(Stdio::piped())
                    .stdout(Stdio::piped())
                    .spawn()
                    .unwrap();
                if let Some(input) = &mut comp.stdin {
                    input.write_all(&out.stdout).unwrap();
                }
                let out = comp.wait_with_output().unwrap();
                self.out.write_all(&out.stdout).unwrap();
            }

            super::OutputKind::Elf => {
                let mut opt: std::process::Child = Command::new("opt")
                    // .args([
                    //      "-O3"
                    //     ])
                    .stdout(Stdio::piped())
                    .stdin(Stdio::piped())
                    .spawn()
                    .unwrap();

                if let Some(input) = &mut opt.stdin {
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
                    .args(["-x", "ir", "-static", 
                    "-O0", 
                    "-nostdlib", "-"])
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
                if let Some(input) = &mut comp.stdin {
                    input.write_all(self.ir.as_bytes()).unwrap();
                }
                let out = comp.wait_with_output().unwrap();
                self.out.write_all(&out.stdout).unwrap();
            }
            super::OutputKind::Ir => {
                let mut opt: std::process::Child = Command::new("opt")
                    .args(["-S", "-O3"])
                    .stdout(Stdio::piped())
                    .stdin(Stdio::piped())
                    .spawn()
                    .unwrap();

                if let Some(input) = &mut opt.stdin {
                    input.write_all(self.ir.as_bytes()).unwrap();
                }
                let out = opt.wait_with_output().unwrap();
                self.out.write_all(&out.stdout).unwrap();
            }
            super::OutputKind::Binary => {
                self.out.write_all(self.ir.as_bytes()).unwrap();
            }
        }
    }

    fn visit_while_start(&mut self, off: i64) {
        use std::fmt::Write;
        let curr = self.next_loop;
        self.next_loop += 1;
        self.stack.push(curr);

        writeln!(
            self.ir,
            "
\tbr label %loop_{curr}_start
\tloop_{curr}_start:
\t%loop_{curr}_cond = call i1 @calculate_tape_off_cond(ptr %tape_position, i64 {off})
\tbr i1 %loop_{curr}_cond, label %loop_{curr}_enter, label %loop_{curr}_end 
\tloop_{curr}_enter:
"
        ).unwrap()
    }

    fn visit_while_end(&mut self, _off: i64) {
        use std::fmt::Write;
        let curr = self.stack.pop().unwrap();
        writeln!(
            self.ir,
            "\tbr label %loop_{curr}_start\n\tloop_{curr}_end:"
        ).unwrap()
    }

    fn visit_mem_off(&mut self, val: u8, off: i64) {
        use std::fmt::Write;
        let val = val as i8;
        writeln!(
            self.ir,
            "\tcall void @offset_tape_val(ptr %tape_position, i64 {off}, i8 {val})"
        )
        .unwrap();
    }

    fn visit_mem_set(&mut self, val: u8, off: i64) {
        use std::fmt::Write;
        let val = val as i8;
        writeln!(
            self.ir,
            "\tcall void @set_tape_val(ptr %tape_position, i64 {off}, i8 {val})"
        )
        .unwrap();
    }

    fn visit_ptr_off(&mut self, off: i64) {
        use std::fmt::Write;
        writeln!(
            self.ir,
            "\tcall void @offset_tape_head(ptr %tape_position, i64 {off})"
        )
        .unwrap();
    }

    fn visit_print(&mut self, off: i64) {
        use std::fmt::Write;
        writeln!(
            self.ir,
            "\tcall void @print_from_tape_off(ptr %tape_position, i64 {off})"
        )
        .unwrap();
    }

    fn visit_read(&mut self, off: i64) {
        use std::fmt::Write;
        writeln!(
            self.ir,
            "\tcall void @read_into_tape_off(ptr %tape_position, i64 {off})"
        )
        .unwrap();
    }
}
