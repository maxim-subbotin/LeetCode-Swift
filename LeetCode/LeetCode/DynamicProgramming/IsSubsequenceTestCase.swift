//
//  IsSubsequenceTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 30.04.2023.
//

import Foundation

public class IsSubsequenceTestCase: TestCase {
    public var name: String = "Is Subsequence"
    let s: String
    let t: String
    var result = false
    
    init(s: String, t: String) {
        self.s = s
        self.t = t
    }
    
    public func run() {
        result = isSubsequence(s, t)
    }
    
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let charS = Array(s)
        let charT = Array(t)
        var indexS = 0
        var indexT = 0
        var run = true
        while run && indexT < charT.count {
            if charT[indexT] == charS[indexS] {
                indexS += 1
                if indexS == charS.count {
                    run = false
                }
            }
            indexT += 1
        }
        return indexS == charS.count
    }
    
    public static func test() -> Bool {
        let test = IsSubsequenceTestCase(s: "abc", t: "ahbgdc")
        test.run()
        return test.result == true
    }
}
