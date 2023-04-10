//
//   LongestPalindromicSubstringTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 01.04.2023.
//

import Foundation

public class LongestPalindromicSubstringTestCase: TestCase {
    public var name: String = "Longest Palindromic Substring"
    let string: String
    var result = ""
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = longestPalindrome(string)
    }
    
    func longestPalindrome(_ s: String) -> String {
        if s.count == 1 { return s }
        let chars = s.map{ $0 }
        if s.count == 2 {
            return chars[0] == chars[1] ? s : "\(chars[0])"
        }
        var maxString = ""
        for i in 0...(s.count - 2) {
            var temp = [chars[i]]
            if chars[i + 1] == chars[i] {
                temp.append(chars[i + 1])
                var allEquals = true
                var j = 1
                while i - j >= 0 && i + j + 1 < chars.count && chars[i - j] == chars[i + j + 1] {
                    temp = [chars[i - j]] + temp + [chars[i + j + 1]]
                    allEquals = (chars[i - j] == chars[i]) && allEquals
                    j += 1
                }
                if allEquals && i - j >= 0 && chars[i - j] == chars[i] {
                    temp.append(chars[i])
                }
            } else if i > 0 {
                var j = 1
                while i - j >= 0 && i + j < chars.count && chars[i - j] == chars[i + j] {
                    temp = [chars[i - j]] + temp + [chars[i + j]]
                    j += 1
                }
            }
            if temp.count > maxString.count {
                maxString = String(temp)
            }
        }
        return maxString
    }
    
    public static func test() -> Bool {
        let test = LongestPalindromicSubstringTestCase(string: "ccc")
        test.run()
        return ["abcddcba"].contains(test.result)
    }
}
