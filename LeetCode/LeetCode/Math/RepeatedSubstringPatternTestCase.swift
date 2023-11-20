//
//  RepeatedSubstringPatternTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 03.11.2023.
//

import Foundation

public class RepeatedSubstringPatternTestCase: TestCase {
    public var name: String = "Repeated Substring Pattern"
    var result = false
    var s: String
    
    init(s: String) {
        self.s = s
    }
    
    public func run() {
        result = repeatedSubstringPattern(s)
    }
    
    func repeatedSubstringPattern(_ s: String) -> Bool {
        (s + s).dropFirst().dropLast().contains(s)
    }
    
    public static func test() -> Bool {
        let test = RepeatedSubstringPatternTestCase(s: "abcabcabcabc")
        test.run()
        return test.result == true
    }
}
