use std::{iter::Peekable, str::Chars};

pub struct Brain<'a> {
    chars: Peekable<Chars<'a>>,
}

type Ast = Vec<AstNode>;

#[derive(Debug)]
pub enum AstNode {
    While(Ast),
    OffPtr(i64),
    ChangeValue(u8),
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
                        '+'|'-' => {
                            val = if *char=='+'{1}else{-1};
                            state = State::Val
                        },
                        '>'|'<' => {
                            val = if *char=='>'{1}else{-1};
                            state = State::Ptr
                        },
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
                }
                State::Ptr => match char {
                    '>' => val += 1,
                    '<' => val -= 1,
                    _ => {
                        top.push(AstNode::OffPtr(val));
                        state = State::Default;
                        consume = false;
                    }
                },
                State::Val => match char {
                    '+' => val += 1,
                    '-' => val -= 1,
                    _ => {
                        top.push(AstNode::ChangeValue(val as u8));
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

    pub fn parse_bad(&mut self) -> Vec<AstNode> {
        let mut top = Ast::new();
        let mut stack = Vec::new();

        while let Some(char) = self.chars.next() {
            match char {
                '+' => top.push(AstNode::ChangeValue(1)),
                '>' => top.push(AstNode::OffPtr(1)),
                '-' => top.push(AstNode::ChangeValue(255)),
                '<' => top.push(AstNode::OffPtr(-1)),
                '.' => top.push(AstNode::Output),
                ',' => top.push(AstNode::Input),
                '[' => {
                    stack.push(top);
                    top = Vec::new();
                }
                ']' => {
                    let mut tmp: Vec<AstNode> = stack.pop().unwrap();
                    tmp.push(AstNode::While(top));
                    top = tmp;
                }
                _ => {}
            }
        }
        assert!(stack.is_empty());

        top
    }
}
