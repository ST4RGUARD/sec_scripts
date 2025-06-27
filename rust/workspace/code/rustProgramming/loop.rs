fn main() {
    let mut x = 1;

    loop {
        println!("x is {}",x);
        x += 1;
        if x > 5 {
            break;
        }
    }
}
