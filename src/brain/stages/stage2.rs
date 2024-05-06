use super::{Ir, Stage};

pub struct Stage2;

impl Stage for Stage2 {
    fn apply(&mut self, input: &mut Vec<Ir>) -> Vec<Ir> {
        ast_to_ir(&input)
    }
}

fn ast_to_ir(ast: &[Ir]) -> Vec<Ir> {
    if true {
        return ast_to_ir_o(0, ast);
    }
    let mut vec = Vec::new();

    let mut offset = 0i64;

    for term in ast {
        match term {
            Ir::While {
                inside: ast,
                ptr_off,
            } => {
                if offset != 0 {
                    vec.push(Ir::OffsetPtr { ptr_off: offset });
                    offset = 0;
                }
                vec.push(Ir::While {
                    inside: ast_to_ir(ast),
                    ptr_off: offset + *ptr_off,
                });
            }
            Ir::OffsetPtr { ptr_off } => offset += *ptr_off,
            Ir::OffsetValue { val_off, ptr_off } => vec.push(Ir::OffsetValue {
                val_off: *val_off,
                ptr_off: offset + *ptr_off,
            }),
            Ir::Print { ptr_off } => vec.push(Ir::Print {
                ptr_off: offset + *ptr_off,
            }),
            Ir::Input { ptr_off } => vec.push(Ir::Input {
                ptr_off: offset + *ptr_off,
            }),

            Ir::Set { ptr_off, val } => vec.push(Ir::Set {
                ptr_off: offset + *ptr_off,
                val: *val,
            }),
        }
    }
    if offset != 0 {
        vec.push(Ir::OffsetPtr { ptr_off: offset });
    }

    vec
}

fn ast_to_ir_o(offset: i64, ast: &[Ir]) -> Vec<Ir> {
    let mut vec = Vec::new();

    let mut local_offset = 0i64;

    for term in ast {
        match term {
            Ir::While { inside, ptr_off } => match inside[..] {
                [Ir::OffsetValue { val_off, ptr_off }] if val_off & 1 == 1 => vec.push(Ir::Set {
                    ptr_off: offset + local_offset + ptr_off + ptr_off,
                    val: 0,
                }),
                _ => {
                    vec.push(Ir::While {
                        inside: ast_to_ir_o(offset + local_offset, inside),
                        ptr_off: offset + local_offset + ptr_off,
                    });
                }
            },
            Ir::OffsetPtr { ptr_off } => local_offset += *ptr_off,
            Ir::OffsetValue { val_off, ptr_off } => vec.push(Ir::OffsetValue {
                val_off: *val_off,
                ptr_off: offset + local_offset + *ptr_off,
            }),
            Ir::Print { ptr_off } => vec.push(Ir::Print {
                ptr_off: offset + local_offset + *ptr_off,
            }),
            Ir::Input { ptr_off } => vec.push(Ir::Input {
                ptr_off: offset + local_offset + *ptr_off,
            }),
            Ir::Set { ptr_off, val } => vec.push(Ir::Set {
                ptr_off: offset + local_offset + *ptr_off,
                val: *val,
            }),
        }
    }
    if local_offset != 0 {
        vec.push(Ir::OffsetPtr {
            ptr_off: local_offset,
        });
    }

    vec
}
