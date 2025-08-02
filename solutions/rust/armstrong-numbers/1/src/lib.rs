pub fn is_armstrong_number(num: u32) -> bool {
    let num_str = num.to_string();
    let len: u32 = num_str.len() as u32;
    let mut sum: u64 = 0;
    for digit in num_str.chars().into_iter() {
        let digit: u64 = digit.to_digit(10).unwrap().pow(len).into();
        sum += digit;
    }
    num as u64 == sum
}
