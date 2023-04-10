//
//  Longest SubstringWithoutRepeatingCharactersTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 02.04.2023.
//

import Foundation

public class LongestSubstringWithoutRepeatingCharactersTestCase: TestCase {
    public var name: String = "Longest Substring Without Repeating Characters"
    let string: String
    var result = 0
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = lengthOfLongestSubstring(string)
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dict = [Character: Int]()
        let chars = Array(s)
        var start = 0
        var maxLength = 0
        for i in 0..<s.count {
            if dict[chars[i]] != nil && dict[chars[i]]! >= start {
                start = (dict[chars[i]] ?? 0) + 1
            }
            dict[chars[i]] = i
            maxLength = max(maxLength, i - start + 1)
        }
        return maxLength
    }
    
    public static func test() -> Bool {
        let test = LongestSubstringWithoutRepeatingCharactersTestCase(string: "pwwkew")
        test.run()
        return test.result == 3
    }
}
