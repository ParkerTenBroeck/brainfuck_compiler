use std::{str::Chars, iter::Peekable};

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