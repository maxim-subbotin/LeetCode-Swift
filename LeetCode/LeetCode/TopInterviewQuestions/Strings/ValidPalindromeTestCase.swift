//
//  ValidPalindromeTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/30/20.
//

import Foundation

public class ValidPalindromeTestCase: TestCase {
    public var name: String = "Valid Palindrome"
    var string: String
    var result = false
    
    init(withString s: String) {
        string = s
    }
    
    public func run() {
        result = isPalindrome(string)
    }
    
    func isPalindrome(_ s: String) -> Bool {
        var startIndex = 0
        var endIndex = s.count - 1
        let chars = Array(s)
        while startIndex < endIndex {
            if !isValid(chars[startIndex]) {
                startIndex += 1
            } else if !isValid(chars[endIndex]) {
                endIndex -= 1
            } else {
                if chars[startIndex].lowercased() != chars[endIndex].lowercased() {
                    return false
                } else {
                    startIndex += 1
                    endIndex -= 1
                }
            }
        }
        
        return true
    }
    
    func isValid(_ char: Character) -> Bool {
        return char.isLetter || char.isNumber
    }
    
    public static func test() -> Bool {
        let test = ValidPalindromeTestCase(withString: "A man, a plan, a canal: Panama")
        test.run()
        return test.result
    }
}
