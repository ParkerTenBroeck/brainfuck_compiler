struct Block{
    inside: Vec<Ir2>,
    known_ptr_off: Option<usize>,
}

enum ExitCondition{
    Forever(usize),
    Immediate(usize),
    Finite(usize),
    Unknown(usize),
    UnknownMoving
}

struct Simple{
    
}

pub enum Ir2{
    While(Block),
    DoWhile(Block),
    WhileTrue(Block),
    If(Block),
    Simple(Simple)
}
