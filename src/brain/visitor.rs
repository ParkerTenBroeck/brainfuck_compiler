use super::ast_to_ir::Ir;

pub trait Visitor {
    fn visit_start(&mut self);
    fn visit_end(&mut self);

    fn visit_while_start(&mut self, off: i64);
    fn visit_while_end(&mut self, off: i64);

    fn visit_mem_off(&mut self, val: u8, off: i64);
    fn visit_mem_set(&mut self, val: u8, off: i64);
    fn visit_ptr_off(&mut self, off: i64);
    fn visit_print(&mut self, off: i64);
    fn visit_read(&mut self, off: i64);
}

pub fn visit_all(code: &Vec<Ir>, visiter: &mut impl Visitor) {
    visiter.visit_start();
    for terminal in code {
        visit_terminal(terminal, visiter);
    }
    visiter.visit_end();
}

fn visit_all_1(code: &Vec<Ir>, visiter: &mut impl Visitor) {
    for terminal in code {
        visit_terminal(terminal, visiter);
    }
}

fn visit_terminal(term: &Ir, visiter: &mut impl Visitor) {
    match term {
        Ir::While { inside, ptr_off } => {
            visiter.visit_while_start(*ptr_off);
            visit_all_1(inside, visiter);
            visiter.visit_while_end(*ptr_off);
        }
        Ir::OffsetValue { val_off, ptr_off } => visiter.visit_mem_off(*val_off, *ptr_off),
        Ir::OffsetPtr { ptr_off } => visiter.visit_ptr_off(*ptr_off),
        Ir::Print { ptr_off } => visiter.visit_print(*ptr_off),
        Ir::Input { ptr_off } => visiter.visit_read(*ptr_off),
        Ir::Set { ptr_off, val } => visiter.visit_mem_set(*val, *ptr_off),
    }
}
