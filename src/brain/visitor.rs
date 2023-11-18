use std::fmt::Write;

use super::parser::Terminal;

pub trait Visitor {
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


pub fn visit_all(code: &Vec<Terminal>, visiter: &mut impl Visitor) {
    visiter.visit_start();
    for terminal in code {
        visit_terminal(terminal, visiter);
    }
    visiter.visit_end();
}

fn visit_all_1(code: &Vec<Terminal>, visiter: &mut impl Visitor) {
    for terminal in code {
        visit_terminal(terminal, visiter);
    }
}

fn visit_terminal(term: &Terminal, visiter: &mut impl Visitor) {
    match term {
        Terminal::If(term) => {
            visiter.visit_if_start();
            visit_all_1(term, visiter);
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

