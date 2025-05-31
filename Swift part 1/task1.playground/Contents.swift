//import UIKit

//let polindrome = "A Toyota! Race fast... safe car: a Toyota"
public func isPalindrome(input: String) -> Bool {
    if (input.isEmpty || input.count == 1)
    {
        return false
    }
    let polindromeClean = input.filter{$0.isLetter}.lowercased()
    if(polindromeClean == String(polindromeClean.reversed()))
    {
        return true
    }
return false
}
//print(isPalindrome(input: polindrome))
