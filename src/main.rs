mod lib {
    pub fn add(a: i32, b: i32) -> i32 {
        a + b
    }

    pub fn sub(a: i32, b: i32) -> i32 {
        a - b
    }

    #[cfg(test)]
    mod tests {
        use super::*;

        #[test]
        fn add_has_correct_result_for_2_positive_integers() {
            let result = add(1, 2);
            assert_eq!(3, result);
        }

        #[test]
        fn add_same_params_in_different_order_produces_same_result() {
            let result = add(1, 2);
            assert_eq!(3, result);
        }

        #[test]
        fn sub_has_correct_result_for_2_positive_integers() {
            let result = sub(2, 1);
            assert_eq!(1, result);
        }
    }
}

use lib::add;
use lib::sub;

fn main() {
    println!("Result of addition = {}", add(1, 2));
    println!("Result of subtraction = {}", sub(2, 1));
}
