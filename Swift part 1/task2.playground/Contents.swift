//import UIKit
public func isBalancedParentheses(input: String) -> Bool {
    if (input.filter {$0 == "("}.count == input.filter {$0 == ")"}.count)
    {
        return true
    }
return false
}
//print(isBalancedParentheses(input: "())("))

