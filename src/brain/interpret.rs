use super::{ast_to_ir::Ir, parser::AstNode};

fn read() -> u8 {
    let bruh = std::io::Read::bytes(std::io::stdin())
        .next()
        .and_then(|result| result.ok());
    if let Some(some) = bruh {
        some as u8
    } else {
        0
    }
}

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
    pub fn interpret(&mut self, code: &Vec<AstNode>) {
        for term in code {
            self.run_term(term);
        }
    }

    pub fn interpret_1(&mut self, code: &Vec<AstNode>) {
        while self.data[self.position] != 0 {
            for term in code {
                self.run_term(term);
            }
        }
    }

    fn run_term(&mut self, term: &AstNode) {
        match term {
            AstNode::While(term) => {
                self.interpret_1(term);
            }
            AstNode::OffPtr(val) => {
                self.position = self.position.wrapping_add_signed(*val as isize);
            }
            AstNode::ChangeValue(val) => {
                self.data[self.position] = self.data[self.position].wrapping_add(*val);
            }
            AstNode::Output => {
                print!("{}", self.data[self.position] as char);
            }
            AstNode::Input => self.data[self.position] = read(),
        }
    }
}

pub struct BrainInterpretIr {
    data: [u8; 0x1000],
    position: i64,
}

impl BrainInterpretIr {
    pub fn new() -> Self {
        Self {
            data: [0; 0x1000],
            position: 0,
        }
    }
    pub fn interpret(&mut self, code: &Vec<Ir>) {
        for term in code {
            self.run_term(term);
        }
    }

    pub fn interpret_1(&mut self, offset: i64, code: &Vec<Ir>) {
        while self.data[(self.position + offset) as usize] != 0 {
            for term in code {
                self.run_term(term);
            }
        }
    }

    fn run_term(&mut self, term: &Ir) {
        match term {
            Ir::While{ inside, ptr_off } => self.interpret_1(*ptr_off, inside),
            Ir::OffsetValue { val_off, ptr_off } => {
                let position = (self.position + ptr_off) as usize;
                self.data[position] = self.data[position].wrapping_add(*val_off);
            }
            Ir::Set { ptr_off, val } => {
                let position = (self.position + ptr_off) as usize;
                self.data[position] = *val;
            },
            Ir::OffsetPtr { ptr_off } => {
                self.position = self.position + ptr_off;
            }
            Ir::Print { ptr_off } => {
                let position = (self.position + ptr_off) as usize;
                print!("{}", self.data[position] as char);
            }
            Ir::Input { ptr_off } => {
                let position = (self.position + ptr_off) as usize;
                self.data[position] = read();
            }
        }
    }
}
