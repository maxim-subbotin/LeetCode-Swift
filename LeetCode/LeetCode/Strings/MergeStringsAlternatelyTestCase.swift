//
//  MergeStringsAlternatelyTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 04.05.2023.
//

import Foundation

public class MergeStringsAlternatelyTestCase: TestCase {
    public var name: String = "Merge Strings Alternately"
    let str1: String
    let str2: String
    var result = ""
    
    init(str1: String, str2: String) {
        self.str1 = str1
        self.str2 = str2
    }
    
    public func run() {
        result = mergeAlternately(str1, str2)
    }
    
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var res = [Character]()
        let chars1 = Array(word1)
        let chars2 = Array(word2)
        for i in 0..<max(chars1.count, chars2.count) {
            if i < chars1.count {
                res.append(chars1[i])
            }
            if i < chars2.count {
                res.append(chars2[i])
            }
        }
        return String(res)
    }
    
    public static func test() -> Bool {
        let test = MergeStringsAlternatelyTestCase(str1: "ab", str2: "pqrs")
        test.run()
        return test.result == "apbqrs"
    }
}
