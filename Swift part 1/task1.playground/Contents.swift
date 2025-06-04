//import UIKit
import Foundation
//let polindrome = "A Toyota! Race fast... safe car: a Toyota"
public func isPalindrome(input: String) -> Bool {

    let normalized = input.lowercased().filter { $0.isLetter }
    let withoutDiacritics = normalized.folding(options: .diacriticInsensitive, locale: nil)
    
    if (withoutDiacritics.count <= 1)
    {
        return false
    }
    if(withoutDiacritics == String(withoutDiacritics.reversed()))
    {
        return true
    }
return false
}
//print(isPalindrome(input: polindrome))
/*
 print(isPalindrome(input: "Détartré"))
 print(isPalindrome(input: "   "))
 print(isPalindrome(input: "a"))
 print(isPalindrome(input: "!?."))
 */
