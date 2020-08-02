use std::fs;
use serde::{Deserialize, Serialize};
use serde_json::Result;

#[derive(Serialize, Deserialize)]
struct Files {
    install : String,
    whereto: String,
    another: String,
}

fn main() {
    let content = fs::read_to_string("rt.txt").unwrap();

    let p : Vec<Files> = serde_json::from_str(&content).unwrap();
    println!("person: {}", p[0].install);

}

fn checkpath(path: String) -> bool {

    match fs::read_link("/home/rajatv/.config/lf") {
        Ok(..) => print!("Is a link"),
        Err(e) => {
            // code : 2 -> if file does not exist
            // code : 22 -> if file is not a link but does exists
            // returns path to where it is linked to
            if e.raw_os_error().unwrap() == 2 {
                println!("No such file or directory")
            } else if e.raw_os_error().unwrap() == 22 {
                println!("Not a link, may be file or folder")
            } else {
                println!("else: {}", e);
            }
        }

    }

    true

}
