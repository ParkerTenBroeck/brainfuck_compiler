use super::parser::AstNode;

#[derive(Debug, Clone)]
pub enum Ir {
    While(Vec<Ir>),
    // DoWhile(Vec<Ir>),
    // WhileTrue(Vec<Ir>),
    OffsetValue { val_off: u8, ptr_off: isize },
    OffsetPtr { ptr_off: isize },
    Print { ptr_off: isize },
    Input { ptr_off: isize },
}


pub fn ast_to_ir(ast: &Vec<AstNode>) -> Vec<Ir> {
    let mut vec = Vec::new();

    let mut offset = 0isize;

    for term in ast {
        match term {
            AstNode::While(ast) => {
                if offset != 0 {
                    vec.push(Ir::OffsetPtr { ptr_off: offset });
                }
                vec.push(Ir::While(ast_to_ir(ast)));
                offset = 0;
            }
            AstNode::IncrementPointer(off) => offset += *off as isize,
            AstNode::DecrementPointer(off) => offset -= *off as isize,
            AstNode::IncrementValue(val) => vec.push(Ir::OffsetValue {
                val_off: *val as u8,
                ptr_off: offset,
            }),
            AstNode::DecrementValue(val) => vec.push(Ir::OffsetValue {
                val_off: 1 + !(*val as u8),
                ptr_off: offset,
            }),
            AstNode::Output => vec.push(Ir::Print { ptr_off: offset }),
            AstNode::Input => vec.push(Ir::Input { ptr_off: offset }),
        }
    }
    if offset != 0 {
        vec.push(Ir::OffsetPtr { ptr_off: offset });
    }

    vec
}
