use std::fmt::Write;

use crate::brain::visitor::Visitor;

pub struct AsmCodeGen<T: Write> {
    asm: T,
    level: usize,
    label_next: usize,
    labels: Vec<usize>,
}

impl<T: Write> AsmCodeGen<T> {
    pub fn new(out: T) -> Self {
        Self {
            asm: out,
            level: 0,
            label_next: 0,
            labels: Vec::new(),
        }
    }

    fn next_label(&mut self) -> usize {
        self.labels.push(self.label_next);
        self.label_next += 1;
        self.label_next - 1
    }

    fn pop_lable(&mut self) -> usize {
        self.labels.pop().unwrap()
    }
}

impl<T: std::fmt::Write> Visitor for AsmCodeGen<T> {
    fn visit_start(&mut self) {
        writeln!(&mut self.asm, "_start:").unwrap();
        writeln!(&mut self.asm, "mov rbx, rdi").unwrap();
        writeln!(&mut self.asm, "jmp START_END").unwrap();

        writeln!(&mut self.asm, "PRINT_OUT:").unwrap();
        writeln!(&mut self.asm, "mov r11, 0x0123456789abcdef").unwrap();
        writeln!(&mut self.asm, "jmp r11").unwrap();

        writeln!(&mut self.asm, "GET_IN:").unwrap();
        writeln!(&mut self.asm, "mov r11, 0x0123456789abcdef").unwrap();
        writeln!(&mut self.asm, "jmp r11").unwrap();

        writeln!(&mut self.asm, "START_END:").unwrap();
    }

    fn visit_end(&mut self) {
        writeln!(&mut self.asm, "ret").unwrap();
    }

    fn visit_while_start(&mut self) {
        // self.white_space();
        let tmp = self.next_label();

        // 0x08, 0x3f, 0x00
        writeln!(&mut self.asm, "cmp byte [rbx], 0").unwrap();
        writeln!(&mut self.asm, "je LOOP_END_{tmp}").unwrap();
        writeln!(&mut self.asm, "LOOP_START_{tmp}:").unwrap();

        //cmp     byte ptr [rdi], 0
        //je      .LBB1_1
        // writeln!(&mut self.buffer, "LOOP START: L{} C{tmp}", self.level).unwrap();
        self.level += 1;
    }

    fn visit_while_end(&mut self) {
        self.level -= 1;

        let tmp = self.pop_lable();
        // 0x08, 0x3f, 0x00
        writeln!(&mut self.asm, "cmp byte [rbx], 0").unwrap();
        writeln!(&mut self.asm, "jne LOOP_START_{tmp}").unwrap();
        writeln!(&mut self.asm, "LOOP_END_{tmp}:").unwrap();
    }

    fn visit_mem_off(&mut self, val: u8, ptr_off: isize) {
        if val == 0 {
        } else if ptr_off == 0 {
            writeln!(&mut self.asm, "add BYTE [rbx], 0x{:02x}", val as u8).unwrap();
        } else if ptr_off.is_negative() {
            writeln!(
                &mut self.asm,
                "add BYTE [rbx-{}], 0x{:02x}",
                ptr_off.abs(),
                val
            )
            .unwrap();
        } else {
            writeln!(
                &mut self.asm,
                "add BYTE [rbx+{ptr_off}], 0x{:02x}",
                val as u8
            )
            .unwrap();
        }
    }

    fn visit_ptr_off(&mut self, val: isize) {
        if val == 0 {
        } else if val.is_negative() {
            writeln!(&mut self.asm, "lea rbx,[rbx-{}]", val.abs()).unwrap();
        } else {
            writeln!(&mut self.asm, "lea rbx,[rbx+{val}]").unwrap();
        }
    }

    fn visit_print(&mut self, ptr_off: isize) {
        if ptr_off.is_negative() {
            writeln!(&mut self.asm, "lea rdi, [rbx-{}]", ptr_off.abs()).unwrap();
        } else {
            writeln!(&mut self.asm, "lea rdi, [rbx+{ptr_off}]").unwrap();
        }
        writeln!(&mut self.asm, "call print").unwrap();
    }

    fn visit_read(&mut self, ptr_off: isize) {
        if ptr_off.is_negative() {
            writeln!(&mut self.asm, "lea rdi, [rbx-{}]", ptr_off.abs()).unwrap();
        } else {
            writeln!(&mut self.asm, "lea rdi, [rbx+{ptr_off}]").unwrap();
        }
        writeln!(&mut self.asm, "call input").unwrap();
    }
}
