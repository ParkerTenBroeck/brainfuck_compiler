use super::{Ir, Stage};

pub struct Stage1;

impl Stage for Stage1 {
    fn apply(&mut self, input: &mut Vec<Ir>) -> Vec<Ir> {
        let mut iter = input.drain(..).peekable();
        while let Some(item) = iter.peek(){
            if !matches!(item, Ir::While { .. }) {
                break;
            }
            iter.next();
        }
        self.apply_(iter)
    }
}

impl Stage1 {
    fn apply_(&mut self, input: impl Iterator<Item = Ir>) -> Vec<Ir> {
        let mut top = Vec::new();


        enum State {
            Default,
            Ptr,
            Val(i64),
        }

        let mut offset: i64 = 0;
        let mut state = State::Default;
        

        for item in input {
            match (&state, &item){
                (State::Ptr, Ir::OffsetPtr { ptr_off }) => {
                    offset += *ptr_off;
                    continue;
                }
                (State::Ptr, _) => {
                    top.push(Ir::OffsetPtr { ptr_off: offset });
                    state = State::Default;
                }

                (State::Val(p), Ir::OffsetValue { ptr_off, val_off }) if *p == *ptr_off => {
                    offset += *val_off as i64;
                    continue;
                }
                (State::Val(p), _) => {
                    top.push(Ir::OffsetValue { val_off: offset as u8, ptr_off: *p });
                    state = State::Default;
                }
                (State::Default, Ir::OffsetPtr { ptr_off }) => {
                    offset = *ptr_off;
                    state = State::Ptr;
                    continue;
                }
                (State::Default, Ir::OffsetValue { ptr_off, val_off }) => {
                    offset = *val_off as i64;
                    state = State::Val(*ptr_off);
                    continue;
                }
                _ => {}
            }
            top.push(item);
            // match item {
            //     Ir::OffsetValue { val_off, ptr_off } => {

            //         if start_ptr_off != curr_ptr_off {
            //             if curr_val_off != 0{
            //                 top.push(Ir::OffsetValue {
            //                     val_off: curr_val_off as u8,
            //                     ptr_off: start_ptr_off,
            //                 });
            //             }
            //             curr_val_off = val_off as i64;
            //             start_ptr_off = Some(ptr_off);
            //         }

            //         curr_val_off += val_off as i64;
            //     }
            //     Ir::OffsetPtr { ptr_off } => {
            //         curr_ptr_off += ptr_off;
            //     }
            //     Ir::Print { ptr_off } => {
            //         top.push(Ir::Print {
            //             ptr_off: ptr_off + curr_ptr_off,
            //         });
            //     }
            //     Ir::Input { ptr_off } => {
            //         top.push(Ir::Input {
            //             ptr_off: ptr_off + curr_ptr_off,
            //         });
            //     }

            //     Ir::While {
            //         mut inside,
            //         ptr_off,
            //     } => {
            //         if curr_val_off != 0 {
            //             top.push(Ir::OffsetValue {
            //                 val_off: curr_val_off as u8,
            //                 ptr_off: start_ptr_off,
            //             });
            //             curr_val_off = 0;
            //         }
            //         if curr_ptr_off != 0 {
            //             top.push(Ir::OffsetPtr { ptr_off: curr_ptr_off });
            //             curr_ptr_off = 0;
            //         }
            //         top.push(Ir::While {
            //             inside: self.apply_(inside.drain(..)),
            //             ptr_off: ptr_off + curr_ptr_off,
            //         });
            //     }
            //     item @ Ir::Set { ptr_off, val } => {
            //         if ptr_off == start_ptr_off {
            //             curr_val_off = 0;
            //         } else {
            //             curr_val_off += val as i64;
            //         }
            //         top.push(item);
            //     }
            // }
        }
        top
    }
}
