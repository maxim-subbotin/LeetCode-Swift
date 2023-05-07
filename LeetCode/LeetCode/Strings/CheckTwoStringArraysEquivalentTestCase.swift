//
//  CheckTwoStringArraysEquivalentTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 04.05.2023.
//

import Foundation

public class CheckTwoStringArraysEquivalentTestCase: TestCase {
    public var name: String = "Check If Two String Arrays are Equivalent"
    let array1: [String]
    let array2: [String]
    var result = false
    
    init(array1: [String], array2: [String]) {
        self.array1 = array1
        self.array2 = array2
    }
    
    public func run() {
        result = arrayStringsAreEqual(array1, array2)
    }
    
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        var run = true
        var result = true
        var wordNum1 = 0
        var wordNum2 = 0
        var index1 = 0
        var index2 = 0
        var buffer1 = Array(word1[0])
        var buffer2 = Array(word2[0])
        while run {
            if buffer1[index1] != buffer2[index2] {
                return false
            }
            index1 += 1
            index2 += 1
            var endOfArray1 = false
            if index1 == buffer1.count {
                index1 = 0
                wordNum1 += 1
                if wordNum1 < word1.count {
                    buffer1 = Array(word1[wordNum1])
                } else {
                    endOfArray1 = true
                }
            }
            var endOfArray2 = false
            if index2 == buffer2.count {
                index2 = 0
                wordNum2 += 1
                if wordNum2 < word2.count {
                    buffer2 = Array(word2[wordNum2])
                } else {
                    endOfArray2 = true
                }
            }
            if endOfArray1 && endOfArray2 {
                run = false
            } else if endOfArray1 || endOfArray1 {
                result = false
                run = false
            }
        }
        return result
    }
    
    public static func test() -> Bool {
        let test = CheckTwoStringArraysEquivalentTestCase(array1: ["ab", "c", "de"], array2: ["ab", "cd", "ef"])
        test.run()
        return test.result == false
    }
}
