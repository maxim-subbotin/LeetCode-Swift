//
//  NumberConsistentStringsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 11.04.2023.
//

import Foundation

public class NumberConsistentStringsTestCase: TestCase {
    public var name: String = "Count the Number of Consistent Strings"
    let allowed: String
    let words: [String]
    var result = 0
    
    init(allowed: String, words: [String]) {
        self.allowed = allowed
        self.words = words
    }
    
    public func run() {
        result = countConsistentStrings(allowed, words)
    }
    
    func countConsistentStrings(_ allowed: String, _ words: [String]) -> Int {
        let set = Set(allowed)
        var n = 0
        for word in words {
            var isConsistent = true
            for ch in Array(word) {
                if !set.contains(ch) {
                    isConsistent = false
                    break
                }
            }
            if isConsistent {
                n += 1
            }
        }
        return n
    }
    
    public static func test() -> Bool {
        let test = NumberConsistentStringsTestCase(allowed: "ab", words: ["ad","bd","aaab","baa","badab"])
        test.run()
        return test.result == 2
    }
}
