//
//  MaximumNestingDepthParenthesesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 04.05.2023.
//

import Foundation

public class MaximumNestingDepthParenthesesTestCase: TestCase {
    public var name: String = "Maximum Nesting Depth of the Parentheses"
    let str: String
    var result = 0
    
    init(str: String) {
        self.str = str
    }
    
    public func run() {
        result = maxDepth(str)
    }
    
    func maxDepth(_ s: String) -> Int {
        var level = 0
        var maxLevel = 0
        let chars = Array(s)
        for i in 0..<chars.count {
            if chars[i] == "(" {
                level += 1
                maxLevel = max(level, maxLevel)
            } else if chars[i] == ")" {
                level -= 1
            }
        }
        return maxLevel
    }
    
    public static func test() -> Bool {
        let test = MaximumNestingDepthParenthesesTestCase(str: "(1)+((2))+(((3)))")
        test.run()
        return test.result == 3
    }
}
