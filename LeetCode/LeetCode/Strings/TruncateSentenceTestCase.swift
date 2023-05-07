//
//  TruncateSentenceTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 04.05.2023.
//

import Foundation

public class TruncateSentenceTestCase: TestCase {
    public var name: String = "Truncate Sentence"
    let string: String
    let k: Int
    var result = ""
    
    init(string: String, k: Int) {
        self.string = string
        self.k = k
    }
    
    public func run() {
        result = truncateSentence(string, k)
    }
    
    func truncateSentence(_ s: String, _ k: Int) -> String {
        let chars = Array(s)
        var n = 0
        for i in 0..<chars.count {
            if chars[i] == " " {
                n += 1
            }
            if n == k {
                return String(chars[0..<i])
            }
        }
        return s
    }
    
    public static func test() -> Bool {
        let test = TruncateSentenceTestCase(string: "What is the solution to this problem", k: 4)
        test.run()
        return test.result == "What is the solution"
    }
}
