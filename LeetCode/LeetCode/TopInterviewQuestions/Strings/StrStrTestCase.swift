//
//  StrStrTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/30/20.
//

import Foundation

public class StrStrTestCase: TestCase {
    public var name: String = "Implement strStr()"
    var string1: String
    var string2: String
    var result = 0
    
    init(withString s1: String, andString s2: String) {
        string1 = s1
        string2 = s2
    }
    
    public func run() {
        result = strStr(string1, string2)
    }
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count == 0 {
            return 0
        }
        if haystack.count == 0 {
            return -1
        }
        if needle.count > haystack.count {
            return -1
        }
        if haystack == needle {
            return 0
        }
        
        var index = 0
        let stack = Array(haystack)
        let search = Array(needle)
        while index < haystack.count - needle.count + 1 {
            if stack[index] != search[0] || stack[index + needle.count - 1] != search.last! {
                index += 1
                continue
            }
            var index2 = 1
            var stringWasFound = true
            while index2 < needle.count {
                if stack[index + index2] != search[index2] {
                    stringWasFound = false
                    break
                }
                index2 += 1
            }
            if stringWasFound {
                return index
            }
            index += 1
        }
        
        return -1
    }
    
    public static func test() -> Bool {
        let test = StrStrTestCase(withString: "abc", andString: "c")
        test.run()
        return test.result == 6
    }
}
