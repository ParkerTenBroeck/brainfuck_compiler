pub mod stage1;
pub mod stage2;
pub mod stage3;

#[derive(Debug, Clone)]
pub enum Ir {
    While { inside: Vec<Ir>, ptr_off: i64 },
    OffsetValue { val_off: u8, ptr_off: i64 },
    OffsetPtr { ptr_off: i64 },
    Print { ptr_off: i64 },
    Input { ptr_off: i64 },
    Set { ptr_off: i64, val: u8 },
}

pub trait Stage {
    fn apply(&mut self, input: &mut Vec<Ir>) -> Vec<Ir>;
}
