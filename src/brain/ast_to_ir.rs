use super::parser::AstNode;

#[derive(Debug, Clone)]
pub enum Ir {
    While{ inside: Vec<Ir>, ptr_off: isize},
    OffsetValue { val_off: u8, ptr_off: isize },
    OffsetPtr { ptr_off: isize },
    Print { ptr_off: isize },
    Input { ptr_off: isize },
}

pub fn ast_to_ir(ast: &[AstNode]) -> Vec<Ir> {
    if true{
        return ast_to_ir_o(0, ast)
    }
    let mut vec = Vec::new();

    let mut offset = 0isize;

    for term in ast {
        match term {
            AstNode::While(ast) => {
                if offset != 0 {
                    vec.push(Ir::OffsetPtr { ptr_off: offset });
                    offset = 0;
                }
                vec.push(Ir::While{inside: ast_to_ir(ast), ptr_off: offset});
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

pub fn ast_to_ir_o(offset: isize, ast: &[AstNode]) -> Vec<Ir> {
    // match ast{
    //     // [AstNode::IncrementValue()]
    //     _ => {}
    // }
    let mut vec = Vec::new();

    let mut local_offset = 0isize;

    for term in ast {
        match term {
            AstNode::While(ast) => {
                // if local_offset != 0 {
                //     vec.push(Ir::OffsetPtr { ptr_off: local_offset });
                //     local_offset = 0;
                // }
                vec.push(Ir::While{inside:ast_to_ir_o(offset + local_offset, ast), ptr_off: offset + local_offset});
            }
            AstNode::IncrementPointer(off) => local_offset += *off as isize,
            AstNode::DecrementPointer(off) => local_offset -= *off as isize,
            AstNode::IncrementValue(val) => vec.push(Ir::OffsetValue {
                val_off: *val as u8,
                ptr_off: offset + local_offset,
            }),
            AstNode::DecrementValue(val) => vec.push(Ir::OffsetValue {
                val_off: 1 + !(*val as u8),
                ptr_off: offset + local_offset,
            }),
            AstNode::Output => vec.push(Ir::Print { ptr_off: offset + local_offset }),
            AstNode::Input => vec.push(Ir::Input { ptr_off: offset + local_offset }),
        }
    }
    if local_offset != 0 {
        vec.push(Ir::OffsetPtr { ptr_off: local_offset });
    }

    vec
}


pub fn ast_to_ir_direct(stage1: &[AstNode]) -> Vec<Ir> {
    let mut vec = Vec::new();

    for term in stage1 {
        match term {
            AstNode::While(ast) => {
                vec.push(Ir::While{ inside: ast_to_ir_direct(ast), ptr_off: 0});
            }
            AstNode::IncrementPointer(off) => vec.push(Ir::OffsetPtr {
                ptr_off: *off as isize,
            }),
            AstNode::DecrementPointer(off) => vec.push(Ir::OffsetPtr {
                ptr_off: -(*off as isize),
            }),
            AstNode::IncrementValue(val) => vec.push(Ir::OffsetValue {
                val_off: *val as u8,
                ptr_off: 0,
            }),
            AstNode::DecrementValue(val) => vec.push(Ir::OffsetValue {
                val_off: 1 + !(*val as u8),
                ptr_off: 0,
            }),
            AstNode::Output => vec.push(Ir::Print { ptr_off: 0 }),
            AstNode::Input => vec.push(Ir::Input { ptr_off: 0 }),
        }
    }

    vec
}
