//
//  LetterCombinationsPhoneNumberTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 03.04.2023.
//

import Foundation

public class LetterCombinationsPhoneNumberTestCase: TestCase {
    public var name: String = "Letter Combinations of a Phone Number"
    let string: String
    var result = [String]()
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = letterCombinations(string)
    }
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return []
        }
        let dict: [Character: [Character]] = [
            "1": ["1"],
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"],
            "0": [" "]
        ]
        let chars = Array(digits)
        let arrs = chars.compactMap({ dict[$0] })
        var res = [String]()
        combine(arrs, i: 0, j: 0, res: &res, current: [])
        return res
    }
    
    func combine(_ arrs: [[Character]], i: Int, j: Int, res: inout [String], current: [Character]) {
        if i >= arrs.count {
            res.append(String(current))
        } else {
            for j in 0..<arrs[i].count {
                var c = current
                c.append(arrs[i][j])
                combine(arrs, i: i + 1, j: 0, res: &res, current: c)
            }
        }
    }
    
    public static func test() -> Bool {
        let test = LetterCombinationsPhoneNumberTestCase(string: "23")
        test.run()
        return test.result == ["ad","ae","af","bd","be","bf","cd","ce","cf"]
    }
}
