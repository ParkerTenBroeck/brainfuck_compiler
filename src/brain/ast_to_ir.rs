use super::parser::Ast;

#[derive(Debug, Clone)]
pub enum Ir {
    While(Vec<Ir>),
    // DoWhile(Vec<Ir>),
    // WhileTrue(Vec<Ir>),
    OffsetValue { val_off: u8, ptr_off: isize },
    OffsetPtr { ptr_off: isize },
    Print { ptr_off: isize },
    PrintKnown { val: u8 },
    Input { ptr_off: isize },
}

struct OptState {}

// pub fn ast_to_ir(ast: Vec<Terminal>) -> Vec<Ir> {
//     let mut vec = Vec::new();

//     for term in ast{
//         match term{
//             Terminal::If(ast) => vec.push(Ir::While(ast_to_ir(ast))),
//             Terminal::IncrementPointer(val) => {
//                 vec.push(Ir::OffsetPtr { ptr_off: val as isize });
//             },
//             Terminal::DecrementPointer(val) => {
//                 vec.push(Ir::OffsetPtr { ptr_off: -(val as isize) });
//             },
//             Terminal::IncrementValue(val) => {
//                 vec.push(Ir::OffsetValue { val_off: val as u8, ptr_off: 0 });
//             },
//             Terminal::DecrementValue(val) => {
//                 vec.push(Ir::OffsetValue { val_off: 1 + !(val as u8), ptr_off: 0 });
//             },
//             Terminal::Output => {
//                 vec.push(Ir::Print { ptr_off: 0 });
//             },
//             Terminal::Input => todo!(),
//         }
//     }

//     vec
// }

pub fn ast_to_ir(ast: Vec<Ast>) -> Vec<Ir> {
    let mut vec = Vec::new();

    let mut offset = 0isize;

    for term in ast {
        match term {
            Ast::If(ast) => {
                if offset != 0 {
                    vec.push(Ir::OffsetPtr { ptr_off: offset });
                }
                vec.push(Ir::While(ast_to_ir(ast)));
                offset = 0;
            }
            Ast::IncrementPointer(off) => offset += off as isize,
            Ast::DecrementPointer(off) => offset -= off as isize,
            Ast::IncrementValue(val) => vec.push(Ir::OffsetValue {
                val_off: val as u8,
                ptr_off: offset,
            }),
            Ast::DecrementValue(val) => vec.push(Ir::OffsetValue {
                val_off: 1 + !(val as u8),
                ptr_off: offset,
            }),
            Ast::Output => vec.push(Ir::Print { ptr_off: offset }),
            Ast::Input => vec.push(Ir::Input { ptr_off: offset }),
        }
    }
    if offset != 0 {
        vec.push(Ir::OffsetPtr { ptr_off: offset });
    }

    vec
}
