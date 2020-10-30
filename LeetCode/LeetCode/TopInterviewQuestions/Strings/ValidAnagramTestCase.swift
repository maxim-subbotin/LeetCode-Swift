//
//  ValidAnagramTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/30/20.
//

import Foundation

public class ValidAnagramTestCase: TestCase {
    public var name: String = "Valid Anagram"
    var string1: String
    var string2: String
    var result = false
    
    init(withString s1: String, andString s2: String) {
        self.string1 = s1
        self.string2 = s2
    }
    
    public func run() {
        result = isAnagram(string1, string2)
    }
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        var stat = Array(repeating: 0, count: 26)
        let firstIndex = Int(Character("a").asciiValue ?? 0)
        for code in s.unicodeScalars {
            stat[Int(code.value) - firstIndex] += 1
        }
        for code in t.unicodeScalars {
            stat[Int(code.value) - firstIndex] -= 1
        }
        for n in stat {
            if n != 0 {
                return false
            }
        }
        
        return true
    }
    
    func code(byChar char: Character) -> UInt8 {
        return char.asciiValue ?? 0
    }
    
    // Method by increment
    /*
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        
        // Character: (<count in first scring>,<count in second string>)
        var map = [Character:(Int,Int)]()
        let arr1 = Array(s)
        let arr2 = Array(t)
        for i in 0..<arr1.count {
            if map[arr1[i]] == nil {
                map[arr1[i]] = (1,0)
            } else {
                map[arr1[i]]!.0 += 1
            }
        }
        for i in 0..<arr2.count {
            if map[arr2[i]] == nil {
                // first string doesn't contain this character!
                return false
            } else {
                map[arr2[i]]!.1 += 1
            }
        }
        for char in map.keys {
            if map[char]!.0 != map[char]!.1 {
                return false
            }
        }
        return true
    }*/
    
    public static func test() -> Bool {
        let test = ValidAnagramTestCase(withString: "cat", andString: "tac")
        test.run()
        return test.result
    }
}
