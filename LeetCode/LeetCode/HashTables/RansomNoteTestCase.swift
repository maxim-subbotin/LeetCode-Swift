//
//  RansomNoteTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 16.05.2023.
//

import Foundation

public class RansomNoteTestCase {
    class Solution {
        func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
            if ransomNote.count > magazine.count {
                return false
            }
            var magDict = [Character: Int]()
            var ransomDict = [Character: Int]()
            var chars = Array(magazine)
            for i in 0..<chars.count {
                magDict[chars[i], default: 0] += 1
            }
            chars = Array(ransomNote)
            for i in 0..<chars.count {
                let c = magDict[chars[i], default: 0]
                if c == 0 {
                    return false
                }
                let k = ransomDict[chars[i], default: 0]
                ransomDict[chars[i]] = k + 1
                if k + 1 > c {
                    return false
                }
            }
            return true
        }
    }
    
    public static func test() {
        let s = Solution()
        print("Test result: \(s.canConstruct("a", "b") == false )")
        print("Test result: \(s.canConstruct("cat", "category") == true )")
        print("Test result: \(s.canConstruct("mad", "mayday") == true )")
    }
}
