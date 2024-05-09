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
    allow_overflow: bool,
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

    fn cell_size(&mut self) -> usize {
        match self.settings.cell_size {
            super::CellSize::C1 => 1,
            super::CellSize::C2 => 2,
            super::CellSize::C4 => 3,
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
            allow_overflow: true,
            next_loop: 0,
            stack: Vec::new(),
        }
    }

    fn visit_start(&mut self) {
        use std::fmt::Write;
        let cell_type = self.cell_type();
        let ptr_align = self.cell_align();
        let stack_size = self.settings.stacksize;
        let stack_size_bytes = self.settings.stacksize * self.cell_size() as u64;
        let nsw = if self.allow_overflow { "" } else { "nsw" };
        let print_buff_len = 1024;

        let tape_ptr_type = format!("ptr noalias nocapture noundef nonnull align {ptr_align}");
        let off_ptr_type = format!("ptr noalias nocapture noundef nonnull align 8");

        writeln!(self.ir, r#"

@print_buff = local_unnamed_addr global <{{ [{print_buff_len} x i8] }}> zeroinitializer, align 1
@print_buff_pos = local_unnamed_addr global i64 0, align 8

@str.0 = internal constant [13 x i8] c"Hello, World\0a"
@str.1 = internal constant [7 x i8] c"Panic!\0a"

declare i32 @write(i32 %fd, ptr %str, i64 %len)


declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) 
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) 
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) 
declare void @llvm.memcpy.i64(ptr %dest, ptr %src, i64 %len, i1 %vol)
declare void @llvm.memset.inline.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) 


define private i32 @print_(ptr readonly noalias nocapture noundef nonnull align 1 %str, i64 %len) nounwind {{
    %r = tail call i32 asm sideeffect "syscall", "={{rax}},0,{{rdi}},{{rdx}},{{rsi}},~{{cx}},~{{flags}},~{{r11}}"(i64 1, i64 1, i64 %len, ptr align 1 %str)
    ;%r = tail call i32 @write(i32 1, ptr %str, i64 %len)
    ret i32 %r
}}




define private void @flush(){{
    %print_buff_pos = load i64, ptr @print_buff_pos
    %has_some = icmp sgt i64 %print_buff_pos, 0

    br label %print
    print:
        store i64 0, ptr @print_buff_pos
        call void @print_(ptr @print_buff, i64 %print_buff_pos)
        ret void
    nothing:
        ret void
}}

define private void @print(ptr readonly noalias nocapture noundef nonnull align 1 %str, i64 %len) nounwind {{
    %print_buff_pos = load i64, ptr @print_buff_pos
    %added = add i64 %print_buff_pos, %len
    %not_enough = icmp sge i64 %added, {print_buff_len}

    br i1 %not_enough, label %flush, label %append

    flush:
        tail call void @flush()
        store i64 %len, ptr @print_buff_pos
        call void @llvm.memcpy.i64(ptr @print_buff, ptr %str, i64 %len, i1 false)

        ret void
    append:
        %buf_app_start = getelementptr inbounds i8, ptr @print_buff, i64 %print_buff_pos
        call void @llvm.memcpy.i64(ptr %buf_app_start, ptr %str, i64 %len, i1 false)
        store i64 %added, ptr @print_buff_pos

        ret void
}}

define private i32 @read_(ptr writeonly noalias nocapture noundef nonnull align 1 %str, i64 %len) nounwind {{
    tail call void @flush()
    %r = call i32 asm sideeffect "syscall", "={{rax}},{{rax}},{{rdi}},{{rdx}},{{rsi}},~{{rcx}},~{{r11}}"(i64 0, i64 0, i64 %len, ptr align 1 %str)
    ret i32 %r
}}
define void @exit(i64 %code) noreturn nounwind{{
    call void asm sideeffect "syscall", "{{rdi}},{{rax}},~{{rcx}},~{{r11}}"(i64 %code, i64 60)
    unreachable
    ret void
}}

define i64 @verify_offset(i64 %offset) {{
    start:
        %lower = icmp sge i64 %offset, 0
        br i1 %lower, label %good.0, label %poison
    good.0:
        %upper = icmp sle i64 %offset, {stack_size}
        br i1 %upper, label %good.1, label %poison
    good.1:
        ret i64 %offset
    poison:
        call void @print(ptr @str.1, i64 7)
        call void @exit(i64 -1)
        unreachable
}}

define ptr @get_offset_tape({tape_ptr_type} %tape, {off_ptr_type} %ptr_off, i64 %off) unnamed_addr alwaysinline {{
    %p.off = load i64, ptr %ptr_off
    %c.off = add i64 %p.off, %off

    ;call void @verify_offset(i64 %c.off)

    %p.add = getelementptr inbounds {cell_type}, ptr %tape, i64 %c.off
    
    ret ptr %p.add
}}

define void @print_from_tape_off({tape_ptr_type} %tape, {off_ptr_type} %ptr_off, i64 %off) unnamed_addr alwaysinline  {{
    %po = call ptr @get_offset_tape({tape_ptr_type} %tape, {off_ptr_type} %ptr_off, i64 %off)
    tail call void @print(ptr %po, i64 1)
    ret void
}}

define void @read_into_tape_off({tape_ptr_type} %tape, {off_ptr_type} %ptr_off, i64 %off) unnamed_addr {{
    %po = call ptr @get_offset_tape({tape_ptr_type} %tape, {off_ptr_type} %ptr_off, i64 %off)
    tail call void @read_(ptr %po, i64 1)
    ret void
}}

define void @offset_tape_head({off_ptr_type} %ptr_off, i64 %off) unnamed_addr {{
    %p = load i64, ptr %ptr_off
    %p.after = add i64 %p, %off
    store i64 %p.after, ptr %ptr_off
    ret void
}}

define void @set_tape_val({tape_ptr_type} %tape, {off_ptr_type} %ptr_off, i64 %off, {cell_type} %val) unnamed_addr {{
    %po = call ptr @get_offset_tape({tape_ptr_type} %tape, {off_ptr_type} %ptr_off, i64 %off)

    store {cell_type} %val, ptr %po

    ret void 
}}

define void @offset_tape_val({tape_ptr_type} %tape, {off_ptr_type} %ptr_off, i64 %off, {cell_type} %val) unnamed_addr {{  
    %po = call ptr @get_offset_tape({tape_ptr_type} %tape, {off_ptr_type} %ptr_off, i64 %off)

    %val.before = load {cell_type}, ptr %po
    %val.after = add {nsw} {cell_type} %val.before, %val
    store {cell_type} %val.after, ptr %po 

    ret void
}}

define i1 @calculate_tape_off_cond({tape_ptr_type} %tape, {off_ptr_type} %ptr_off, i64 %off) unnamed_addr {{
    %po = call ptr @get_offset_tape({tape_ptr_type} %tape, {off_ptr_type} %ptr_off, i64 %off)

    %val = load {cell_type}, ptr %po

    %res = icmp ne {cell_type} %val, 0

    ret i1 %res
}}



define void @_start() unnamed_addr {{
    start:

    %tape = alloca [{stack_size} x {cell_type}], align {ptr_align}
    call void @llvm.lifetime.start.p0(i64 {stack_size_bytes}, ptr nonnull %tape)
    call void @llvm.memset.p0.i64(ptr noundef nonnull align {ptr_align} dereferenceable({stack_size_bytes}) %tape, i8 0, i64 {stack_size_bytes}, i1 false)


    %tape_position = alloca i64
    store i64 0, ptr %tape_position
"#).unwrap();

        // write!(self.ir, "call void @llvm.memset.inline.p0.i64()").unwrap();
    }

    fn visit_end(&mut self) {
        use std::fmt::Write;
        let stack_size_bytes = self.settings.stacksize * self.cell_size() as u64;

        write!(self.ir,
            r#"
    
    call void @llvm.lifetime.end.p0(i64 {stack_size_bytes}, ptr nonnull %tape)

    call void @flush()
    call void @exit(i32 0)
    unreachable
    ret void
}}
"#,
        ).unwrap();
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
                    .args([
                         "-O3"
                        ])
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
                    .args(["-x", "ir", 
                    "-static", 
                    "-O3", 
                    "-nostdlib", 
                    "-"])
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
                    input.write_all(&out.stdout).unwrap();
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
\t%loop_{curr}_cond = call i1 @calculate_tape_off_cond(ptr %tape, ptr %tape_position, i64 {off})
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
            "\tcall void @offset_tape_val(ptr %tape, ptr %tape_position, i64 {off}, i8 {val})"
        )
        .unwrap();
    }

    fn visit_mem_set(&mut self, val: u8, off: i64) {
        use std::fmt::Write;
        let val = val as i8;
        writeln!(
            self.ir,
            "\tcall void @set_tape_val(ptr %tape, ptr %tape_position, i64 {off}, i8 {val})"
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
            "\tcall void @print_from_tape_off(ptr %tape, ptr %tape_position, i64 {off})"
        )
        .unwrap();
    }

    fn visit_read(&mut self, off: i64) {
        use std::fmt::Write;
        writeln!(
            self.ir,
            "\tcall void @read_into_tape_off(ptr %tape, ptr %tape_position, i64 {off})"
        )
        .unwrap();
    }
}
