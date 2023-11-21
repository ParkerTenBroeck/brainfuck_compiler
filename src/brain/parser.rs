use std::{iter::Peekable, str::Chars};

pub struct Brain<'a> {
    chars: Peekable<Chars<'a>>,
}

type Ast = Vec<AstNode>;

#[derive(Debug)]
pub enum AstNode {
    While(Ast),
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

    pub fn parse(&mut self) -> Vec<AstNode> {
        let mut top = Ast::new();
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
                        '.' => top.push(AstNode::Output),
                        ',' => top.push(AstNode::Input),
                        '[' => {
                            stack.push(top);
                            top = Vec::new();
                        }
                        ']' => {
                            let mut tmp: Vec<AstNode> = stack.pop().unwrap();
                            // if the first statement in our program is an if statement
                            // uh dont include it
                            if !(stack.is_empty() && tmp.is_empty()) {
                                tmp.push(AstNode::While(top));
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
                        top.push(AstNode::IncrementPointer(val));
                        state = State::Default;
                        val = 0;
                        consume = false;
                    }
                },
                State::DecPtr => match char {
                    '<' => val += 1,
                    _ => {
                        top.push(AstNode::DecrementPointer(val));
                        state = State::Default;
                        val = 0;
                        consume = false;
                    }
                },
                State::IncVal => match char {
                    '+' => val += 1,
                    _ => {
                        top.push(AstNode::IncrementValue(val));
                        state = State::Default;
                        val = 0;
                        consume = false;
                    }
                },
                State::DecVal => match char {
                    '-' => val += 1,
                    _ => {
                        top.push(AstNode::DecrementValue(val));
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
