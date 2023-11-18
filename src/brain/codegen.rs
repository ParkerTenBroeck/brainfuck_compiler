use std::fmt::Write;

use super::visitor::Visitor;


pub struct AsmCodeGen {
    pub asm: String,
    level: usize,
    label_next: usize,
    labels: Vec<usize>,
}

impl AsmCodeGen {
    pub fn new() -> Self {
        Self {
            asm: String::new(),
            level: 0,
            label_next: 0,
            labels: Vec::new(),
        }
    }

    fn next_label(&mut self) -> usize{
        self.labels.push(self.label_next);
        self.label_next += 1;
        self.label_next - 1
    }

    fn pop_lable(&mut self) -> usize{
        self.labels.pop().unwrap()
    }
}

impl Visitor for AsmCodeGen {
    fn visit_start(&mut self){
        writeln!(&mut self.asm, "jmp START_END").unwrap();

        writeln!(&mut self.asm, "PRINT_OUT:").unwrap();
        writeln!(&mut self.asm, "mov r11, 0123456789abcdef").unwrap();
        writeln!(&mut self.asm, "jmp r11").unwrap();

        writeln!(&mut self.asm, "GET_IN:").unwrap();        
        writeln!(&mut self.asm, "mov r11, 0123456789abcdef").unwrap();
        writeln!(&mut self.asm, "jmp r11").unwrap();

        writeln!(&mut self.asm, "START_END:").unwrap();
    }

    fn visit_end(&mut self){
        writeln!(&mut self.asm, "ret").unwrap();
    } 
    
    fn visit_if_start(&mut self) {
        // self.white_space();
        let tmp = self.next_label();

        // 0x08, 0x3f, 0x00
        writeln!(&mut self.asm, "cmp byte [rdi], 0").unwrap();
        writeln!(&mut self.asm, "je LOOP_END_{tmp}").unwrap();
        writeln!(&mut self.asm, "LOOP_START_{tmp}:").unwrap();

        //cmp     byte ptr [rdi], 0
        //je      .LBB1_1
        // writeln!(&mut self.buffer, "LOOP START: L{} C{tmp}", self.level).unwrap();
        self.level += 1;
    }

    fn visit_if_end(&mut self) {
        self.level -= 1;
        // self.white_space();
        let tmp = self.pop_lable();
        // 0x08, 0x3f, 0x00
        writeln!(&mut self.asm, "cmp byte [rdi], 0").unwrap();
        writeln!(&mut self.asm, "jne LOOP_START_{tmp}").unwrap();
        writeln!(&mut self.asm, "LOOP_END_{tmp}:").unwrap();
        // writeln!(&mut self.buffer, "LOOP END: :{} C{tmp}", self.level).unwrap();
    }

    fn visit_increment_val(&mut self, val: usize) {
        // self.white_space();
        writeln!(&mut self.asm, "add BYTE [rdi], 0x{:02x}", val as u8).unwrap();
    }

    fn visit_decrement_val(&mut self, val: usize) {
        // self.white_space();
        writeln!(&mut self.asm, "add BYTE [rdi], 0x{:02x}", 1+!(val as u8)).unwrap();
    }

    fn visit_increment_ptr(&mut self, val: usize) {
        // self.white_space();
        writeln!(&mut self.asm, "lea rdi,[rdi+{val}]").unwrap();
    }

    fn visit_decrement_ptr(&mut self, val: usize) {
        // self.white_space();
        writeln!(&mut self.asm, "lea rdi,[rdi-{val}]").unwrap();
    }

    fn visit_print(&mut self) {
        // self.white_space();
        writeln!(&mut self.asm, "push rdi").unwrap();
        writeln!(&mut self.asm, "call PRINT_OUT").unwrap();
        writeln!(&mut self.asm, "pop rdi").unwrap();
    }

    fn visit_read(&mut self) {
        // self.white_space();
        writeln!(&mut self.asm, "push rdi").unwrap();
        writeln!(&mut self.asm, "call GET_IN").unwrap();
        writeln!(&mut self.asm, "pop rdi").unwrap();
    }
}

