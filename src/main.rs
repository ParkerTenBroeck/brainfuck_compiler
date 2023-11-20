#![feature(tuple_trait)]
#![feature(fn_traits)]
#![feature(unboxed_closures)]

use std::io::Write;

use crate::brain::codegen;


mod brain;
mod dyn_link;
mod bf_programs;

fn main() {


    use crate::brain::{interpret::BrainInterpret, parser::Brain};
    use crate::brain::{interpret::BrainInterpretIr, codegen::machine::MachineGen};


    let ast = Brain::new(bf_programs::MANDELBROT_CALC).parse();
    // println!("{:#?}", ast);
    // println!();
    // BrainInterpret::new().interpret(&ast);
    // return;
    let ir = brain::ast_to_ir::ast_to_ir(ast);
    // println!("{:#?}", ir);
    // BrainInterpretIr::new().interpret(&ir);
    // return;
    // println!();

    extern "C" fn print(char: &u8) {
        _ = std::io::stdout().lock().write_all(&[*char]);
        // print!("{}", *char as char);
    }
    extern "C" fn read(char: &mut u8) {
        let bruh = std::io::Read::bytes(std::io::stdin()) 
            .next()
            .and_then(|result| result.ok());
        if let Some(some) = bruh{
            *char = some as u8;
        }else{
            *char = 0;
        }
    }

    let mut instructions = String::new();
    let mut visiter = codegen::assembly::AsmCodeGen::new(&mut instructions);
    brain::visitor::visit_all(&ir, &mut visiter);
    // println!("{}", instructions);
    std::fs::write("./out.asm", &instructions).unwrap();

    let mut instructions = Vec::new();
    let mut visiter = MachineGen::new(&mut instructions, print, read);
    brain::visitor::visit_all(&ir, &mut visiter);

    std::fs::write("./out.bin", &instructions).unwrap();

    use mmap::{MapOption, MemoryMap};

    let map = MemoryMap::new(
        instructions.len(),
        &[
            MapOption::MapReadable,
            MapOption::MapWritable,
            MapOption::MapExecutable,
        ],
    )
    .unwrap();

    unsafe{
        std::ptr::copy(instructions.as_ptr(), map.data(), instructions.len());
        let func: extern "C" fn(*mut u8) = std::mem::transmute(map.data());

        let mut vals = [0u8; 0x1000];
        func(vals.as_mut_slice().as_mut_ptr());
    }

    println!();
}
