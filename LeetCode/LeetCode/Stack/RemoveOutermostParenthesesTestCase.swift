//
//  RemoveOutermostParenthesesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 31.05.2023.
//

import Foundation

public class RemoveOutermostParenthesesTestCase: TestCase {
    public var name: String = "Remove Outermost Parentheses"
    let str: String
    var result = ""
    
    init(str: String) {
        self.str = str
    }
    
    public func run() {
        result = removeOuterParentheses(str)
    }
    
    func removeOuterParentheses(_ s: String) -> String {
        var stack = [Character]()
        var level = 0
        var result = [Character]()
        for ch in Array(s) {
            if ch == "(" {
                stack.append(ch)
                level += 1
                if level != 1 {
                    result.append(ch)
                }
            } else if ch == ")" {
                _ = stack.removeLast()
                level -= 1
                if level != 0 {
                    result.append(ch)
                }
            }
        }
        return String(result)
    }
    
    public static func test() -> Bool {
        let test = RemoveOutermostParenthesesTestCase(str: "(()())(())(()(()))")
        test.run()
        return test.result == "()()()()(())"
    }
}
