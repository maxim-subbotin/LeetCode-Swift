//
//  IsomorphicStringsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 05.04.2023.
//

import Foundation

public class IsomorphicStringsTestCase: TestCase {
    public var name: String = "Isomorphic Strings"
    let str1: String
    let str2: String
    var result = false
    
    init(str1: String, str2: String) {
        self.str1 = str1
        self.str2 = str2
    }
    
    public func run() {
        result = isIsomorphic(str1, str2)
    }
    
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        let charS = Array(s)
        let charT = Array(t)
        var dictS = [Character: Int]()
        var dictT = [Character: Int]()
        var max1 = 0
        var max2 = 0
        for i in 0..<charS.count {
            var m1 = -1
            if dictS[charS[i]] == nil {
                m1 = max1
                dictS[charS[i]] = m1
                max1 += 1
            } else {
                m1 = dictS[charS[i]]!
            }
            var m2 = -1
            if dictT[charT[i]] == nil {
                m2 = max2
                dictT[charT[i]] = m2
                max2 += 1
            } else {
                m2 = dictT[charT[i]]!
            }
            if m1 != m2 {
                return false
            }
        }
        return true
    }
    
    public static func test() -> Bool {
        let test = IsomorphicStringsTestCase(str1: "foo", str2: "bar")
        test.run()
        return test.result == true
    }
}
