//
//  LongestCommonPrefixTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 31.10.2020.
//

import Foundation

public class LongestCommonPrefixTestCase: TestCase {
    public var name: String = "Longest Common Prefix"
    var strings: [String]
    var result = ""
    
    init(withStrings strs: [String]) {
        self.strings = strs
    }
    
    
    public func run() {
        result = longestCommonPrefix(strings)
    }
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        if strs.count == 1 {
            return strs[0]
        }
        let sorted = strs.sorted()
        var prefix = ""
        let str1 = Array(sorted.first!)
        let str2 = Array(sorted.last!)
        for i in 0..<min(str1.count, str2.count) {
            if str1[i] == str2[i] {
                prefix.append(str1[i])
            } else {
                return prefix
            }
        }
        return prefix
    }
    
    public static func test() -> Bool {
        let test = LongestCommonPrefixTestCase(withStrings: ["flower","flow","flight"])
        test.run()
        return test.result == "fl"
    }
}
