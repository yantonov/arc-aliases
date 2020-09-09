use std::io;
use std::process::exit;

mod ticket_number;

fn main() {
    let mut line = String::new();
    match io::stdin().read_line(&mut line) {
        Ok(_) => {
            match ticket_number::ticket_number(&line) {
                Ok(ticket_number) => {
                    println!("{}", ticket_number);
                }
                Err(_) => {
                    eprintln!("ticket number not found");
                    exit(2);
                }
            }
        }
        Err(_) => {
            eprintln!("error while reading line from stdin");
            exit(1);
        }
    };
}
