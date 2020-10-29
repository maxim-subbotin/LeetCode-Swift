//
//  FirstUniqueCharactedInStringTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/29/20.
//

import Foundation

public class FirstUniqueCharactedInStringTestCase: TestCase {
    public var name: String = "First Unique Character in a String"
    var string: String
    var result = -1
    
    init(withString s: String) {
        string = s
    }
    
    public func run() {
        result = firstUniqChar(string)
    }
    
    func firstUniqChar(_ s: String) -> Int {
        var charArray = Array(repeating: -2, count: 26)
        let chars = Array(s)
        let startIndex = Int(Character("a").asciiValue ?? 0)
        for i in 0..<chars.count {
            let index = Int(chars[i].asciiValue ?? 0) - startIndex
            if charArray[index] == -2 {
                charArray[index] = i
            } else {
                charArray[index] = -1
            }
        }
        
        var minIndex = Int.max
        for i in 0..<charArray.count {
            if charArray[i] >= 0 {
                minIndex = min(minIndex, charArray[i])
            }
        }
        
        return minIndex == Int.max ? -1 : minIndex
    }
    
    /*
    func firstUniqChar(_ s: String) -> Int {
        let chars = Array(s)
        var map = [Character:(Int,Int)]()
        for i in 0..<chars.count {
            if map[chars[i]] == nil {
                map[chars[i]] = (1, i)
            } else {
                map[chars[i]]!.0 += 1
            }
        }
        
        var minIndex = Int.max
        for key in map.keys {
            if map[key]!.0 == 1 {
                minIndex = min(minIndex, map[key]!.1)
            }
        }
        
        return minIndex == Int.max ? -1 : minIndex
    }
    */
    
    public static func test() -> Bool {
        let s = "blackcathasblackeyesandblackfluff"
        let test = FirstUniqueCharactedInStringTestCase(withString: s)
        test.run()
        return test.result == 7
    }
}
