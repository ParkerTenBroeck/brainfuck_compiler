use crate::brain::{codegen, interpret};


mod brain;
mod dyn_link;
mod bf_programs;

struct TimerScope{
    name: String,
    childern: Vec<TimerScope>,
    duration: std::time::Duration
    // vec
}

impl TimerScope{
    pub fn start(name: impl ToString, timed: impl FnOnce(&mut Self)) -> Self{
        let mut new = TimerScope{
            name: name.to_string(),
            childern: Vec::new(),
            duration: std::time::Duration::from_micros(0),
        };
        let start = std::time::Instant::now();
        timed(&mut new);
        new.duration = start.elapsed();
        new
    }
    pub fn named<T>(&mut self, name: impl ToString, timed: impl FnOnce(&mut Self) -> T) -> T{
        let mut new = TimerScope{
            name: name.to_string(),
            childern: Vec::new(),
            duration: std::time::Duration::from_micros(0),
        };
        let start = std::time::Instant::now();
        let ret = timed(&mut new);
        new.duration = start.elapsed();
        self.childern.push(new);
        ret
    }

    fn to_string_r(&self, left: &mut String, append: &mut String){
        
        use std::fmt::Write;

        
        if left.is_empty(){
            writeln!(append, "{}:\t{:.4}ms", self.name, self.duration.as_secs_f64() * 1000.0).unwrap();
        }

        for (index, child) in self.childern.iter().enumerate(){
            let last = index == self.childern.len() - 1; 
            
            // left.push_str("┃ ");
            // writeln!(append, "{}", left).unwrap();
            // left.pop();
            // left.pop();

            left.push_str(if last {"┗━"} else{"┣━"});
            append.push_str(&left);
            writeln!(append, "{}:\t{:.4}ms", child.name, child.duration.as_secs_f64() * 1000.0).unwrap();
            left.pop();
            left.pop();

            left.push_str(if last {"  "} else{"┃ "});
            child.to_string_r(left, append);
            left.pop();
            left.pop();
        }
    }
}

impl std::string::ToString for TimerScope{
    fn to_string(&self) -> String {
        let mut string = String::new();
        self.to_string_r(&mut String::new(),&mut string);
        string
    }
}

fn main() {

    // let timer = TimerScope::start("BrainFuck", |scope|{
    //     std::thread::sleep(std::time::Duration::from_millis(10));
    //     scope.named("Compiler", |scope|{
    //         scope.named("Compile Stage 1", |_|{
    //             std::thread::sleep(std::time::Duration::from_millis(5));
    //         });
    //         scope.named("Compile Stage 2", |_|{
    //             std::thread::sleep(std::time::Duration::from_millis(7));
    //         });

    //         scope.named("Compile Stage 3", |_|{
    //             std::thread::sleep(std::time::Duration::from_millis(11));
    //         });
    //     });

    //     scope.named("Bruh!!!", |_|{
    //         std::thread::sleep(std::time::Duration::from_millis(55));
    //     });

    //     scope.named("Runtime", |scope|{
    //         scope.named("Loading", |_|{
    //             std::thread::sleep(std::time::Duration::from_millis(1));
            
    //         });
    //         scope.named("Running", |_|{
    //             std::thread::sleep(std::time::Duration::from_millis(500));
    //         });
    //     });

    // });

    // println!("{}", timer.to_string());
    // if true{
    //     return;
    // }

    use crate::brain::parser::Brain;
    use crate::brain::codegen::machine::MachineGen;

    extern "C" fn print(char: &u8) {
        _ = std::io::Write::write_all(&mut std::io::stdout().lock(), &[*char]);
        // print!("{}", *char as char);
    }
    extern "C" fn read(char: &mut u8) {
        let bruh = std::io::Read::bytes(std::io::stdin()) 
            .next()
            .and_then(|result| result.ok())
            .unwrap_or(0);
        *char = bruh;
    }

    let timer = TimerScope::start("BrainFucl", |scope|{
        let (ast, ir, asm, machine) = scope.named("Compiler", |scope|{
            let ast = scope.named("Ast Gen", |_|{
                Brain::new(bf_programs::MANDELBROT_CALC).parse()
            });

            let ir = scope.named("Ir Gen", |_|{
                brain::ast_to_ir::ast_to_ir(&ast)
            });

            let asm = scope.named("Asm Gen", |_|{
                let mut instructions = String::new();
                let mut visiter = codegen::assembly::AsmCodeGen::new(&mut instructions);
                brain::visitor::visit_all(&ir, &mut visiter);
                instructions
            });

            let machine = scope.named("Machine Gen", |_|{
                let mut instructions = Vec::new();
                let mut visiter = MachineGen::new(&mut instructions, print, read);
                brain::visitor::visit_all(&ir, &mut visiter);
                instructions
            });
        

            (ast, ir, asm, machine)
        });

        let mmap = scope.named("Machine Setup", |_|{
            use mmap::{MapOption, MemoryMap};

            let map = MemoryMap::new(
                machine.len(),
                &[
                    MapOption::MapReadable,
                    MapOption::MapWritable,
                    MapOption::MapExecutable,
                ],
            )
            .unwrap();
        
            unsafe{
                std::ptr::copy(machine.as_ptr(), map.data(), machine.len());
            }
            map
        });

        scope.named("Runtime", |scope|{
            scope.named("Machine", |_|{
                let func: extern "C" fn(*mut u8) = unsafe{ std::mem::transmute(mmap.data()) };

                let mut vals = [0u8; 0x1000];
                func(vals.as_mut_slice().as_mut_ptr());
            });

            // scope.named("Ast Interpret", |_|{
            //     interpret::BrainInterpret::new().interpret(&ast);
            // });
            // scope.named("Ir Interpret", |_|{
            //     interpret::BrainInterpretIr::new().interpret(&ir);
            // });
        });

    });

    println!("{}", timer.to_string());

    // let ast = Brain::new(bf_programs::MANDELBROT_CALC).parse();
    
    // // let elapsed = start.elapsed();
    // let ir = brain::ast_to_ir::ast_to_ir(&ast);
    // // println!("{:#?}", ast);
    // // println!();
    // // BrainInterpret::new().interpret(&ast);
    // // return;
    // // println!("{:#?}", ir);
    // // BrainInterpretIr::new().interpret(&ir);
    // // return;
    // // println!();



    // let mut instructions = String::new();
    // let mut visiter = codegen::assembly::AsmCodeGen::new(&mut instructions);
    // brain::visitor::visit_all(&ir, &mut visiter);
    // // println!("{}", instructions);
    // std::fs::write("./out.asm", &instructions).unwrap();

    // let mut instructions = Vec::new();
    // let mut visiter = MachineGen::new(&mut instructions, print, read);
    // brain::visitor::visit_all(&ir, &mut visiter);

    // std::fs::write("./out.bin", &instructions).unwrap();

    // use mmap::{MapOption, MemoryMap};

    // let map = MemoryMap::new(
    //     instructions.len(),
    //     &[
    //         MapOption::MapReadable,
    //         MapOption::MapWritable,
    //         MapOption::MapExecutable,
    //     ],
    // )
    // .unwrap();

    // unsafe{
    //     std::ptr::copy(instructions.as_ptr(), map.data(), instructions.len());
        // let func: extern "C" fn(*mut u8) = std::mem::transmute(map.data());

        // let mut vals = [0u8; 0x1000];
        // func(vals.as_mut_slice().as_mut_ptr());
    // }

    // println!();
}
