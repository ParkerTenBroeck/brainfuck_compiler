use std::{iter::Peekable, str::Chars};

use super::stages::Ir;

pub struct BfParser<'a> {
    chars: Peekable<Chars<'a>>,
}

impl<'a> BfParser<'a> {
    pub fn new(data: &'a str) -> Self {
        Self {
            chars: data.chars().peekable(),
        }
    }

    pub fn parse_good(&mut self) -> Vec<Ir> {
        let mut top = Vec::new();
        let mut stack = Vec::new();

        enum State {
            Default,
            Ptr,
            Val,
        }

        let mut val: i64 = 0;
        let mut state = State::Default;

        while let Some(char) = self.chars.peek() {
            let mut consume = true;
            match state {
                State::Default => {
                    match char {
                        '+' | '-' => {
                            val = if *char == '+' { 1 } else { -1 };
                            state = State::Val
                        }
                        '>' | '<' => {
                            val = if *char == '>' { 1 } else { -1 };
                            state = State::Ptr
                        }
                        '.' => top.push(Ir::Print { ptr_off: 0 }),
                        ',' => top.push(Ir::Input { ptr_off: 0 }),
                        '[' => {
                            stack.push(top);
                            top = Vec::new();
                        }
                        ']' => {
                            let mut tmp: Vec<Ir> = stack.pop().unwrap();
                            // if the first statement in our program is an if statement
                            // uh dont include it
                            if !(stack.is_empty() && tmp.is_empty()) {
                                tmp.push(Ir::While {
                                    inside: top,
                                    ptr_off: 0,
                                });
                            }
                            top = tmp;
                        }
                        _ => {}
                    }
                }
                State::Ptr => match char {
                    '>' => val += 1,
                    '<' => val -= 1,
                    _ => {
                        top.push(Ir::OffsetPtr { ptr_off: val });
                        state = State::Default;
                        consume = false;
                    }
                },
                State::Val => match char {
                    '+' => val += 1,
                    '-' => val -= 1,
                    _ => {
                        top.push(Ir::OffsetValue {
                            val_off: val as u8,
                            ptr_off: 0,
                        });
                        state = State::Default;
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

    pub fn parse(&mut self) -> Vec<Ir> {
        let mut top = Vec::new();
        let mut stack = Vec::new();

        while let Some(char) = self.chars.next() {
            match char {
                '+' => top.push(Ir::OffsetValue {
                    val_off: 1,
                    ptr_off: 0,
                }),
                '>' => top.push(Ir::OffsetPtr { ptr_off: 1 }),
                '-' => top.push(Ir::OffsetValue {
                    val_off: 255,
                    ptr_off: 0,
                }),
                '<' => top.push(Ir::OffsetPtr { ptr_off: -1 }),
                '.' => top.push(Ir::Print { ptr_off: 0 }),
                ',' => top.push(Ir::Input { ptr_off: 0 }),
                '[' => {
                    stack.push(top);
                    top = Vec::new();
                }
                ']' => {
                    let mut tmp: Vec<Ir> = stack.pop().unwrap();
                    tmp.push(Ir::While {
                        inside: top,
                        ptr_off: 0,
                    });
                    top = tmp;
                }
                _ => {}
            }
        }
        assert!(stack.is_empty());

        top
    }
}
