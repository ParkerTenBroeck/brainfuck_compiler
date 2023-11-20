use std::{iter::Peekable, str::Chars};

pub struct Brain<'a> {
    chars: Peekable<Chars<'a>>,
}

#[derive(Debug)]
pub enum Ast {
    If(Vec<Ast>),
    IncrementPointer(usize),
    DecrementPointer(usize),
    IncrementValue(usize),
    DecrementValue(usize),
    Output,
    Input,
}

impl<'a> Brain<'a> {
    pub fn new(data: &'a str) -> Self {
        Self {
            chars: data.chars().peekable(),
        }
    }

    pub fn parse(&mut self) -> Vec<Ast> {
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
                        '.' => top.push(Ast::Output),
                        ',' => top.push(Ast::Input),
                        '[' => {
                            stack.push(top);
                            top = Vec::new();
                        }
                        ']' => {
                            let mut tmp: Vec<Ast> = stack.pop().unwrap();
                            // if the first statement in our program is an if statement
                            // uh dont include it
                            if !(stack.is_empty() && tmp.is_empty()) {
                                tmp.push(Ast::If(top));
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
                        top.push(Ast::IncrementPointer(val));
                        state = State::Default;
                        val = 0;
                        consume = false;
                    }
                },
                State::DecPtr => match char {
                    '<' => val += 1,
                    _ => {
                        top.push(Ast::DecrementPointer(val));
                        state = State::Default;
                        val = 0;
                        consume = false;
                    }
                },
                State::IncVal => match char {
                    '+' => val += 1,
                    _ => {
                        top.push(Ast::IncrementValue(val));
                        state = State::Default;
                        val = 0;
                        consume = false;
                    }
                },
                State::DecVal => match char {
                    '-' => val += 1,
                    _ => {
                        top.push(Ast::DecrementValue(val));
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
