use super::parser::AstNode;

#[derive(Debug, Clone)]
pub enum Ir {
    While{ inside: Vec<Ir>, ptr_off: i64},
    OffsetValue { val_off: u8, ptr_off: i64 },
    OffsetPtr { ptr_off: i64 },
    Print { ptr_off: i64 },
    Input { ptr_off: i64 },
    Set{ptr_off: i64, val: u8}
}

pub fn ast_to_ir(ast: &[AstNode]) -> Vec<Ir> {
    if true{
        return ast_to_ir_o(0, ast)
    }
    let mut vec = Vec::new();

    let mut offset = 0i64;

    for term in ast {
        match term {
            AstNode::While(ast) => {
                if offset != 0 {
                    vec.push(Ir::OffsetPtr { ptr_off: offset });
                    offset = 0;
                }
                vec.push(Ir::While{inside: ast_to_ir(ast), ptr_off: offset});
            }
            AstNode::OffPtr(off) => offset += *off,
            AstNode::ChangeValue(val) => vec.push(Ir::OffsetValue {
                val_off: *val as u8,
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

fn ast_to_ir_o(offset: i64, ast: &[AstNode]) -> Vec<Ir> {
    
    let mut vec = Vec::new();

    let mut local_offset = 0i64;

    for term in ast {
        match term {
            AstNode::While(ast) => {
                match ast[..]{
                    [AstNode::ChangeValue(val)] if val & 1 == 1 => {
                        vec.push(Ir::Set { ptr_off: offset + local_offset, val: 0 })
                    }
                    _ => {
                        vec.push(Ir::While{inside:ast_to_ir_o(offset + local_offset, ast), ptr_off: offset + local_offset});
                    }
                }
            }
            AstNode::OffPtr(off) => local_offset += *off,
            AstNode::ChangeValue(val) => vec.push(Ir::OffsetValue {
                val_off: *val as u8,
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
            AstNode::OffPtr(off) => vec.push(Ir::OffsetPtr {
                ptr_off: *off,
            }),
            AstNode::ChangeValue(val) => vec.push(Ir::OffsetValue {
                val_off: *val,
                ptr_off: 0,
            }),
            AstNode::Output => vec.push(Ir::Print { ptr_off: 0 }),
            AstNode::Input => vec.push(Ir::Input { ptr_off: 0 }),
        }
    }

    vec
}
