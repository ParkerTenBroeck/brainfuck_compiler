use super::parser::Terminal;

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