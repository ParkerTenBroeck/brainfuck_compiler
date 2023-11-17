use std::{fs::File, io::{BufWriter, Write}};

pub fn main() {
    let res = std::process::Command::new("sh")
        .arg("-c").arg("./comp_all.sh")
        .current_dir("./xtra")
        .output()
        .unwrap();

        let res = std::process::Command::new("objdump")
        .arg("-t").arg("./xtra/out/all.out")
        .output()
        .unwrap();

    let regex = regex::Regex::new(r#"([\dabcdefABCDEF]+).*.text.dyn_fn\s*[\dabcdefABCDEF]+\s*(.*)"#).unwrap();
    let output = String::from_utf8(res.stdout).unwrap();

    let file = File::create("./xtra/out/syms").unwrap();
    let mut file = BufWriter::new(file);
    
    for capture in regex.captures_iter(&output){
        let (_full, captures) = capture.extract::<2>();
        let val = 2 + u64::from_str_radix(captures[0], 16).unwrap();
        file.write_all(&val.to_be_bytes()).unwrap();
        let val: u16 = captures[1].len().try_into().unwrap();
        file.write_all(&val.to_be_bytes()).unwrap();
        file.write_all(captures[1].as_bytes()).unwrap();
    }



    // panic!("{:?}", map);
}
