//
//  ValidParenthesesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 16.11.2020.
//

import Foundation

public class ValidParenthesesTestCase: TestCase {
    public var name: String = "Valid Parentheses"
    let s: String
    var result = false
    
    init(withString s: String) {
        self.s = s
    }
    
    public func run() {
        result = isValid(s)
    }
    
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let chars = Array(s)
        for c in chars {
            if stack.count == 0 {
                stack.append(c)
            } else {
                if let last = stack.last {
                    if last == "{" && c == "}" {
                        stack.removeLast()
                    } else if last == "[" && c == "]" {
                        stack.removeLast()
                    } else if last == "(" && c == ")" {
                        stack.removeLast()
                    } else {
                        stack.append(c)
                    }
                }
            }
        }
        
        return stack.count == 0
    }
    
    public static func test() -> Bool {
        let test = ValidParenthesesTestCase(withString: "[{}([])]")
        test.run()
        return test.result
    }
}
