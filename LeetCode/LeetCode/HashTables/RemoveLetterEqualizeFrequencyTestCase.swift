//
//  RemoveLetterEqualizeFrequencyTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 16.04.2023.
//

import Foundation

public class RemoveLetterEqualizeFrequencyTestCase: TestCase {
    public var name: String = "Remove Letter To Equalize Frequency"
    let word: String
    var result = true
    
    init(word: String) {
        self.word = word
    }
    
    public func run() {
        result = equalFrequency(word)
    }
    
    func equalFrequency(_ word: String) -> Bool {
        var stat = Array(repeating: 0, count: 26)
        let bytes = [UInt8](word.utf8)
        for i in 0..<bytes.count {
            stat[Int(bytes[i]) - 97] += 1
        }
        var stat2 = [Int: Int]()
        var numNonZero = 0
        for i in 0..<stat.count {
            if stat[i] != 0 {
                numNonZero += 1
                stat2[stat[i]] = (stat2[stat[i]] ?? 0) + 1
            }
        }
        if numNonZero == 1 {
            return true
        }
        let keys = Array(stat2.keys)
        if keys.count == 1, let k = keys.first, let n = stat2[k] {
            if n == bytes.count {
                return true
            }
        }
        if keys.count != 2 {
            return false
        }
        let num1 = keys[0]
        let num2 = keys[1]
        let a = stat2[num1]!
        let b = stat2[num2]!
        if (num1 == 1 && a == 1) || (num2 == 1 && b == 1) {
            return true
        }
        return (a == 1 && num1 - num2 == 1) || (b == 1 && num2 - num1 == 1)
    }
    
    public static func test() -> Bool {
        let test = RemoveLetterEqualizeFrequencyTestCase(word: "aaaabbbbccc")
        test.run()
        return test.result == false
    }
}
