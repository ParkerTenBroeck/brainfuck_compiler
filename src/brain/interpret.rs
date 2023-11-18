use super::{ast_to_ir::Ir, parser::Ast};

pub struct BrainInterpret {
    data: [u8; 100],
    position: usize,
}

impl BrainInterpret {
    pub fn new() -> Self {
        Self {
            data: [0; 100],
            position: 0,
        }
    }
    pub fn interpret(&mut self, code: &Vec<Ast>) {
        for term in code {
            self.run_term(term);
        }
    }

    pub fn interpret_1(&mut self, code: &Vec<Ast>) {
        while self.data[self.position] != 0 {
            for term in code {
                self.run_term(term);
            }
        }
    }

    fn run_term(&mut self, term: &Ast) {
        match term {
            Ast::If(term) => {
                self.interpret_1(term);
            }
            Ast::IncrementPointer(val) => {
                self.position += *val;
            }
            Ast::DecrementPointer(val) => {
                self.position -= *val;
            }
            Ast::IncrementValue(val) => {
                self.data[self.position] += (*val) as u8;
            }
            Ast::DecrementValue(val) => {
                self.data[self.position] -= (*val) as u8;
            }
            Ast::Output => {
                print!("{}", self.data[self.position] as char);
            }
            Ast::Input => todo!(),
        }
    }
}

pub struct BrainInterpretIr {
    data: [u8; 100],
    position: usize,
}

impl BrainInterpretIr {
    pub fn new() -> Self {
        Self {
            data: [0; 100],
            position: 0,
        }
    }
    pub fn interpret(&mut self, code: &Vec<Ir>) {
        for term in code {
            self.run_term(term);
        }
    }

    pub fn interpret_1(&mut self, code: &Vec<Ir>) {
        while self.data[self.position] != 0 {
            for term in code {
                self.run_term(term);
            }
        }
    }

    fn run_term(&mut self, term: &Ir) {
        match term {
            Ir::While(inner) => self.interpret_1(inner),
            Ir::OffsetValue { val_off, ptr_off } => {
                let position = (self.position as isize + ptr_off) as usize;
                
                self.data[position] = self.data[position].wrapping_add(*val_off);
            }
            Ir::OffsetPtr { ptr_off } => {
                self.position = (self.position as isize + ptr_off) as usize
            }
            Ir::Print { ptr_off } => {
                let position = (self.position as isize + ptr_off) as usize;
                print!("{}", self.data[position] as char);
            }
            Ir::PrintKnown { val } => {
                todo!()
            }
            Ir::Input { ptr_off } => {
                todo!()
            }
        }
    }
}
