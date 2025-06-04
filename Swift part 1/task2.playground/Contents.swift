//import UIKit
public func isBalancedParentheses(input: String) -> Bool {
    var counter = 0
    for char in input {
        if char == "(" {
            counter += 1
        } else if char == ")" {
            counter -= 1
            if counter < 0 {
                return false
            }
        }
    }
return counter == 0
}
//print(isBalancedParentheses(input: ")("))

