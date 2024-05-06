#![allow(warnings)]
use std::{
    collections::HashMap,
    ffi::{CStr, CString, OsStr, OsString},
    marker::PhantomData,
};

use super::Ir;

struct Block {
    inside: Vec<Ir2>,
    known_ptr_off: Option<usize>,
}

enum WhileOpt {
    Forever,
    NeverEntered,
    EnterImmediateExit,
    SimpleCounted(u8),
    Unknown,
    SetZero,
}

struct WhileResult {
    info: WhileOpt,
    known_iterations: Option<u64>,
    known_ptr_off_per_iter: i64,
}

enum Simple {
    UpdatePtr(isize),
    SetValue { ptr_off: isize, val: u8 },
    AddValue { ptr_off: isize, val: u8 },
    PrintN { ptr_off: isize, num: usize },
    ReadN { ptr_off: isize, num: usize },
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum Known {
    Value(u8),
    Clobbered,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum Touched {
    Clobbered,
    Offset(u8),
}

struct TouchedMap {
    touched: HashMap<i64, Touched>,
}

impl TouchedMap {
    fn new() -> Self {
        Self {
            touched: HashMap::new(),
        }
    }

    fn update_val(&mut self, ptr_pos: i64, update: u8) {
        if let Some(Touched::Offset(val)) = self.touched.get_mut(&ptr_pos) {
            *val = val.wrapping_add(update);
        }
    }

    fn set_val(&mut self, ptr_pos: i64, value: Touched) {
        self.touched.insert(ptr_pos, value);
    }
}

// struct LocalValues{
//     knowns: HashMap<isize, Known>,
// }

// impl LocalValues{
//     fn local() -> Self{
//         Self { knowns: Default::default() }
//     }
//     fn is_known_zero(&self, ptr_pos: isize) -> bool{
//         self.knowns.get(&ptr_pos).map(|val|{
//             matches!(val, Known::Value(0))
//         }).unwrap_or(false)
//     }
//     fn get_knonw(&self, ptr_pos: isize) -> Option<u8>{
//         self.knowns.get(&ptr_pos).and_then(|val|{
//             match val{
//                 Known::Value(val) => Some(*val),
//                 Known::Clobbered => None,
//             }
//         })
//     }
//     fn update_val(&mut self, ptr_pos: isize, update: u8){
//         if let Some(Known::Value(val)) = self.knowns.get_mut(&ptr_pos){
//             *val = val.wrapping_add(update);
//         }
//     }
//     fn set_val(&mut self, ptr_pos: isize, value: Known){
//         self.knowns.insert(ptr_pos, value);
//     }

//     fn clobber(&mut self){
//         self.knowns.clear();
//     }

// }

struct Stage3Opt {
    knowns: HashMap<i64, Known>,
    ptr_clobbered: bool,
}

impl Stage3Opt {
    fn is_known_zero(&self, ptr_pos: i64) -> bool {
        if self.ptr_clobbered {
            return false;
        }
        self.knowns
            .get(&ptr_pos)
            .map(|val| matches!(val, Known::Value(0)))
            .unwrap_or(true)
    }
    fn get_knonw(&self, ptr_pos: i64) -> Option<u8> {
        if self.ptr_clobbered {
            return None;
        }
        self.knowns.get(&ptr_pos).and_then(|val| match val {
            Known::Value(val) => Some(*val),
            Known::Clobbered => None,
        })
    }
    fn update_val(&mut self, ptr_pos: i64, update: u8) {
        if self.ptr_clobbered {
            return;
        }
        if let Some(Known::Value(val)) = self.knowns.get_mut(&ptr_pos) {
            *val = val.wrapping_add(update);
        }
    }
    fn set_val(&mut self, ptr_pos: i64, value: Known) {
        if self.ptr_clobbered {
            return;
        }
        self.knowns.insert(ptr_pos, value);
    }

    fn clobber_mem(&mut self) {
        self.ptr_clobbered = true;
        self.knowns.clear();
    }

    fn run_in(&mut self, ir: &Vec<Ir>) {
        let mut curr_ptr_off = 0;

        for item in ir {
            match item {
                Ir::While { inside, ptr_off } => {
                    if self.get_knonw(curr_ptr_off) == Some(0) {
                        continue;
                    }
                    let res = self.while_thing(ir, curr_ptr_off);
                    if let Some(iterations) = res.known_iterations {
                        curr_ptr_off += iterations as i64 * res.known_ptr_off_per_iter;
                    } else if res.known_ptr_off_per_iter != 0 {
                        self.clobber_mem();
                    }
                    //TODO maybe update the offset? possibly uneeded
                    self.set_val(curr_ptr_off, Known::Value(0));

                    match res.info {
                        WhileOpt::Forever => todo!(),
                        WhileOpt::NeverEntered => todo!(),
                        WhileOpt::EnterImmediateExit => todo!(),
                        WhileOpt::SimpleCounted(_) => todo!(),
                        WhileOpt::Unknown => todo!(),
                        WhileOpt::SetZero => todo!(),
                    }
                }
                Ir::OffsetValue { val_off, ptr_off } => {
                    self.update_val(*ptr_off + curr_ptr_off, *val_off);
                }
                Ir::OffsetPtr { ptr_off } => {
                    curr_ptr_off += *ptr_off;
                }
                Ir::Print { ptr_off } => {}
                Ir::Input { ptr_off } => self.set_val(*ptr_off + curr_ptr_off, Known::Clobbered),
                Ir::Set { ptr_off, val } => todo!(),
            }
        }
    }

    fn while_thing(&mut self, ir: &Vec<Ir>, entry_off: i64) -> WhileResult {
        let mut touched = TouchedMap::new();
        let mut result = WhileResult {
            info: todo!(),
            known_ptr_off_per_iter: 0,
            known_iterations: None,
        };
        let mut simple = true;
        for item in ir {
            match item {
                Ir::While { .. } => {}
                Ir::OffsetValue { val_off, ptr_off } => {
                    touched.update_val(*ptr_off + result.known_ptr_off_per_iter, *val_off);
                }
                Ir::OffsetPtr { ptr_off } => {
                    result.known_ptr_off_per_iter += ptr_off;
                }
                Ir::Print { ptr_off } => {
                    simple = false;
                }
                Ir::Input { ptr_off } => {
                    simple = false;
                    touched.set_val(*ptr_off + result.known_ptr_off_per_iter, Touched::Clobbered);
                }
                Ir::Set { ptr_off, val } => todo!(),
            }
        }

        result
    }
}

pub enum Ir2 {
    While(Block),
    DoWhile(Block),
    WhileTrue(Block),
    If(Block),
    Simple(Simple),
}

#[test]
fn bruh() {
    for step in (1u8..=255).step_by(2) {
        for value in 0u8..=255 {
            let mut current = value;
            let mut iters = 0;
            while current != 0 {
                iters += 1;
                current = current.wrapping_add(step);
            }
            print!("{step}+{value}: {iters}\t")
        }
    }
}

#[test]
fn test2() {
    for step in 0u8..=255 {
        for start in 0u8..=255 {
            if !(step.trailing_zeros() < start.trailing_zeros()) {
                continue;
            }
            let mut current = start;
            let mut iters = 0;
            while current != 0 {
                iters += 1;
                current = current.wrapping_add(step);
            }
            print!("{step}+{start}: {iters}\t")
        }
    }
}

pub fn gcd(mut n: u64, mut m: u64) -> u64 {
    assert!(n != 0 && m != 0);
    while m != 0 {
        if m < n {
            std::mem::swap(&mut m, &mut n);
        }
        m %= n;
    }
    n
}

#[test]
fn test_other() {
    let wrap = 256i32;
    for start in 0..wrap {
        for step in 1..wrap {
            let mut current = start;
            let mut i = 0;
            for _ in 0..100000 {
                if current == 0 {
                    break;
                }
                current = current.wrapping_add(step) % wrap;
                i += 1;
            }
            let gcd = gcd(wrap as u64, step as u64);
            let terminates = start as u64 % gcd == 0;
            let my_terminates = step.trailing_zeros() <= start.trailing_zeros();
            // println!("step:{:3}+start:{:3} {:6}, gcf(wrap, start){}, {}",step,start,i, gcd, terminates);
            if my_terminates != terminates {
                // if
                panic!();
            }
        }
        println!()
    }
}
