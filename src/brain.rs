use std::{iter::Peekable, str::Chars};

pub struct BrainInterpret {
    data: [u8; 0x1000],
    position: usize,
}

impl BrainInterpret {
    pub fn new() -> Self {
        Self {
            data: [0; 0x1000],
            position: 0,
        }
    }
    pub fn interpret(&mut self, code: &Vec<Terminal>) {
        for term in code {
            self.run_term(term);
        }
    }

    pub fn interpret_1(&mut self, code: &Vec<Terminal>) {
        while self.data[self.position] != 0 {
            for term in code {
                self.run_term(term);
            }
        }
    }

    fn run_term(&mut self, term: &Terminal) {
        match term {
            Terminal::If(term) => {
                self.interpret_1(term);
            }
            Terminal::IncrementPointer(val) => {
                self.position += *val;
            }
            Terminal::DecrementPointer(val) => {
                self.position -= *val;
            }
            Terminal::IncrementValue(val) => {
                self.data[self.position] += (*val) as u8;
            }
            Terminal::DecrementValue(val) => {
                self.data[self.position] -= (*val) as u8;
            }
            Terminal::Output => {
                print!("{}", self.data[self.position] as char);
            }
            Terminal::Input => todo!(),
        }
    }
}

pub struct Brain<'a> {
    chars: Peekable<Chars<'a>>,
    data: &'a str,
    tmp_count: usize,
}

#[derive(Debug)]
pub enum Terminal {
    If(Vec<Terminal>),
    IncrementPointer(usize),
    DecrementPointer(usize),
    IncrementValue(usize),
    DecrementValue(usize),
    Output,
    Input,
}

#[test]
fn bruh() {
    let code = r#"
    [ This program prints "Hello World!" and a newline to the screen, its
    length is 106 active command characters. [It is not the shortest.]
  
    This loop is an "initial comment loop", a simple way of adding a comment
    to a BF program such that you don't have to worry about any command
    characters. Any ".", ",", "+", "-", "<" and ">" characters are simply
    ignored, the "[" and "]" characters just have to be balanced. This
    loop and the commands it contains are ignored because the current cell
    defaults to a value of 0; the 0 value causes this loop to be skipped.
  ]
  ++++++++               Set Cell #0 to 8
  [
      >++++               Add 4 to Cell #1; this will always set Cell #1 to 4
      [                   as the cell will be cleared by the loop
          >++             Add 2 to Cell #2
          >+++            Add 3 to Cell #3
          >+++            Add 3 to Cell #4
          >+              Add 1 to Cell #5
          <<<<-           Decrement the loop counter in Cell #1
      ]                   Loop until Cell #1 is zero; number of iterations is 4
      >+                  Add 1 to Cell #2
      >+                  Add 1 to Cell #3
      >-                  Subtract 1 from Cell #4
      >>+                 Add 1 to Cell #6
      [<]                 Move back to the first zero cell you find; this will
                          be Cell #1 which was cleared by the previous loop
      <-                  Decrement the loop Counter in Cell #0
  ]                       Loop until Cell #0 is zero; number of iterations is 8
  
  The result of this is:
  Cell no :   0   1   2   3   4   5   6
  Contents:   0   0  72 104  88  32   8
  Pointer :   ^
  
  >>.                     Cell #2 has value 72 which is 'H'
  >---.                   Subtract 3 from Cell #3 to get 101 which is 'e'
  +++++++..+++.           Likewise for 'llo' from Cell #3
  >>.                     Cell #5 is 32 for the space
  <-.                     Subtract 1 from Cell #4 for 87 to give a 'W'
  <.                      Cell #3 was set to 'o' from the end of 'Hello'
  +++.------.--------.    Cell #3 for 'rl' and 'd'
  >>+.                    Add 1 to Cell #5 gives us an exclamation point
  >++.                    And finally a newline from Cell #6    
"#;
    let bf = Brain::new(code).parse();
    println!("{:#?}", bf);
    BrainInterpret::new().interpret(&bf);
    let mut visiter = StringSudoCode::new();
    codegen(&bf, &mut visiter);
    println!("{}", visiter.buffer);
}

impl<'a> Brain<'a> {
    pub fn new(data: &'a str) -> Self {
        Self {
            chars: data.chars().peekable(),
            data,
            tmp_count: 0,
        }
    }

    pub fn parse(&mut self) -> Vec<Terminal> {
        let mut top = Vec::new();
        let mut stack = Vec::new();

        enum State {
            Default,
            IncPtr,
            DecPtr,
            IncVal,
            DecVal,
        }

        let mut val: usize = 0;
        let mut state = State::Default;

        while let Some(char) = self.chars.peek() {
            let mut consume = true;
            match state {
                State::Default => {
                    match char {
                        '+' => state = State::IncVal,
                        '>' => state = State::IncPtr,
                        '-' => state = State::DecVal,
                        '<' => state = State::DecPtr,
                        '.' => top.push(Terminal::Output),
                        ',' => top.push(Terminal::Input),
                        '[' => {
                            stack.push(top);
                            top = Vec::new();
                        }
                        ']' => {
                            let mut tmp: Vec<Terminal> = stack.pop().unwrap();
                            // if the first statement in our program is an if statement
                            // uh dont include it
                            if !(stack.is_empty() && tmp.is_empty()) {
                                tmp.push(Terminal::If(top));
                            }
                            top = tmp;
                        }
                        _ => {}
                    }
                    match char {
                        '+' | '>' | '-' | '<' => val += 1,
                        _ => {}
                    }
                }
                State::IncPtr => match char {
                    '>' => val += 1,
                    _ => {
                        top.push(Terminal::IncrementPointer(val));
                        state = State::Default;
                        val = 0;
                        consume = false;
                    }
                },
                State::DecPtr => match char {
                    '<' => val += 1,
                    _ => {
                        top.push(Terminal::DecrementPointer(val));
                        state = State::Default;
                        val = 0;
                        consume = false;
                    }
                },
                State::IncVal => match char {
                    '+' => val += 1,
                    _ => {
                        top.push(Terminal::IncrementValue(val));
                        state = State::Default;
                        val = 0;
                        consume = false;
                    }
                },
                State::DecVal => match char {
                    '-' => val += 1,
                    _ => {
                        top.push(Terminal::DecrementValue(val));
                        state = State::Default;
                        val = 0;
                        consume = false;
                    }
                },
            }
            if consume {
                self.chars.next();
            }
        }

        assert!(stack.is_empty());

        top
    }
}

use std::fmt::Write;

trait Visiter {
    fn visit_start(&mut self);
    fn visit_end(&mut self);

    fn visit_if_start(&mut self);
    fn visit_if_end(&mut self);

    fn visit_increment_val(&mut self, val: usize);
    fn visit_decrement_val(&mut self, val: usize);
    fn visit_increment_ptr(&mut self, val: usize);
    fn visit_decrement_ptr(&mut self, val: usize);
    fn visit_print(&mut self);
    fn visit_read(&mut self);
}

struct StringSudoCode {
    buffer: String,
    level: usize,
    label_next: usize,
    labels: Vec<usize>,
}

impl StringSudoCode {
    pub fn new() -> Self {
        Self {
            buffer: String::new(),
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

    fn white_space(&mut self) {
        for _ in 0..self.level {
            self.buffer.push(' ');
        }
    }
}

impl Visiter for StringSudoCode {
    fn visit_start(&mut self){
        writeln!(&mut self.buffer, "jmp START_END").unwrap();

        writeln!(&mut self.buffer, "PRINT_OUT:").unwrap();
        writeln!(&mut self.buffer, "mov r11, 0123456789abcdef").unwrap();
        writeln!(&mut self.buffer, "jmp r11").unwrap();

        writeln!(&mut self.buffer, "GET_IN:").unwrap();        
        writeln!(&mut self.buffer, "mov r11, 0123456789abcdef").unwrap();
        writeln!(&mut self.buffer, "jmp r11").unwrap();

        writeln!(&mut self.buffer, "START_END:").unwrap();
    }

    fn visit_end(&mut self){
        writeln!(&mut self.buffer, "ret").unwrap();
    } 
    
    fn visit_if_start(&mut self) {
        // self.white_space();
        let tmp = self.next_label();

        // 0x08, 0x3f, 0x00
        writeln!(&mut self.buffer, "cmp byte [rdi], 0").unwrap();
        writeln!(&mut self.buffer, "je LOOP_END_{tmp}").unwrap();
        writeln!(&mut self.buffer, "LOOP_START_{tmp}:").unwrap();

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
        writeln!(&mut self.buffer, "cmp byte [rdi], 0").unwrap();
        writeln!(&mut self.buffer, "jne LOOP_START_{tmp}").unwrap();
        writeln!(&mut self.buffer, "LOOP_END_{tmp}:").unwrap();
        // writeln!(&mut self.buffer, "LOOP END: :{} C{tmp}", self.level).unwrap();
    }

    fn visit_increment_val(&mut self, val: usize) {
        // self.white_space();
        writeln!(&mut self.buffer, "add BYTE [rdi], 0x{:02x}", val as u8).unwrap();
    }

    fn visit_decrement_val(&mut self, val: usize) {
        // self.white_space();
        writeln!(&mut self.buffer, "add BYTE [rdi], 0x{:02x}", 1+!(val as u8)).unwrap();
    }

    fn visit_increment_ptr(&mut self, val: usize) {
        // self.white_space();
        writeln!(&mut self.buffer, "lea rdi,[rdi+{val}]").unwrap();
    }

    fn visit_decrement_ptr(&mut self, val: usize) {
        // self.white_space();
        writeln!(&mut self.buffer, "lea rdi,[rdi-{val}]").unwrap();
    }

    fn visit_print(&mut self) {
        // self.white_space();
        writeln!(&mut self.buffer, "push rdi").unwrap();
        writeln!(&mut self.buffer, "call PRINT_OUT").unwrap();
        writeln!(&mut self.buffer, "pop rdi").unwrap();
    }

    fn visit_read(&mut self) {
        // self.white_space();
        writeln!(&mut self.buffer, "push rdi").unwrap();
        writeln!(&mut self.buffer, "call GET_IN").unwrap();
        writeln!(&mut self.buffer, "pop rdi").unwrap();
    }
}

fn codegen(code: &Vec<Terminal>, visiter: &mut impl Visiter) {
    visiter.visit_start();
    for terminal in code {
        codegen_terminal(terminal, visiter);
    }
    visiter.visit_end();
}

fn codegen_1(code: &Vec<Terminal>, visiter: &mut impl Visiter) {
    for terminal in code {
        codegen_terminal(terminal, visiter);
    }
}

fn codegen_terminal(term: &Terminal, visiter: &mut impl Visiter) {
    match term {
        Terminal::If(term) => {
            visiter.visit_if_start();
            codegen_1(term, visiter);
            visiter.visit_if_end();
        }
        Terminal::IncrementPointer(inc) => visiter.visit_increment_ptr(*inc),
        Terminal::DecrementPointer(dec) => visiter.visit_decrement_ptr(*dec),
        Terminal::IncrementValue(inc) => visiter.visit_increment_val(*inc),
        Terminal::DecrementValue(dec) => visiter.visit_decrement_val(*dec),
        Terminal::Output => visiter.visit_print(),
        Terminal::Input => visiter.visit_read(),
    }
}

