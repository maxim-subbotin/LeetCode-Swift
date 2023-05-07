//
//  SplitStringBalancedStringsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 02.05.2023.
//

import Foundation

public class SplitStringBalancedStringsTestCase: TestCase {
    public var name: String = "Split a String in Balanced Strings"
    let string: String
    var result = 0
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = balancedStringSplit(string)
    }
    
    func balancedStringSplit(_ s: String) -> Int {
        var sum = 0
        let chars = Array(s)
        var r = 0
        var l = 0
        for i in 0..<chars.count {
            if chars[i] == "R" {
                r += 1
            } else {
                l += 1
            }
            if r == l {
                sum += 1
                r = 0
                l = 0
            }
        }
        return sum
    }
    
    public static func test() -> Bool {
        let test = SplitStringBalancedStringsTestCase(string: "RLRRRLLRLL")
        test.run()
        return test.result == 2
    }
}
