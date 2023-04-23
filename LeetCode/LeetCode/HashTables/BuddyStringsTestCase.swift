//
//  BuddyStringsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 16.04.2023.
//

import Foundation

public class BuddyStringsTestCase: TestCase {
    public var name: String = "Buddy Strings"
    let s1: String
    let s2: String
    var result = false
    
    init(_ s1: String, _ s2: String) {
        self.s1 = s1
        self.s2 = s2
    }
    
    public func run() {
        result = buddyStrings(s1, s2)
    }
    
    func buddyStrings(_ s: String, _ goal: String) -> Bool {
        if s.count != goal.count {
            return false
        }
        let b1 = [UInt8](s.utf8)
        let b2 = [UInt8](goal.utf8)
        var s = 0
        var diffs = [Int]()
        for i in 0..<b1.count {
            let v = Int(b1[i]) - Int(b2[i])
            if v != 0 {
                s += 1
                diffs.append(i)
            }
        }
        if s == 0 {
            if b1.count > 26 {
                return true
            } else {
                var stat = Array(repeating: 0, count: 26)
                for i in 0..<b1.count {
                    stat[Int(b1[i]) - 97] += 1
                    if stat[Int(b1[i]) - 97] == 2 {
                        return true
                    }
                }
                return false
            }
        } else {
            return s == 2 && b1[diffs[0]] == b2[diffs[1]] && b1[diffs[1]] == b2[diffs[0]]
        }
    }
    
    public static func test() -> Bool {
        let test = BuddyStringsTestCase("ab", "ca")
        test.run()
        return test.result == false
    }
}
