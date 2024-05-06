use super::stages::Ir;

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

pub struct BfInterpreter {
    data: [u8; 0x1000],
    position: i64,
}

impl BfInterpreter {
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
            Ir::While { inside, ptr_off } => self.interpret_1(*ptr_off, inside),
            Ir::OffsetValue { val_off, ptr_off } => {
                let position = (self.position + ptr_off) as usize;
                self.data[position] = self.data[position].wrapping_add(*val_off);
            }
            Ir::Set { ptr_off, val } => {
                let position = (self.position + ptr_off) as usize;
                self.data[position] = *val;
            }
            Ir::OffsetPtr { ptr_off } => {
                self.position = self.position + ptr_off;
            }
            Ir::Print { ptr_off } => {
                let position = (self.position + ptr_off) as usize;
                print!("{}", self.data[position] as u8 as char);
            }
            Ir::Input { ptr_off } => {
                let position = (self.position + ptr_off) as usize;
                self.data[position] = read();
            }
        }
    }
}
