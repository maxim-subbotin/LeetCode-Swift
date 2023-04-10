//
//  WordBreakIITestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 04.04.2023.
//

import Foundation

public class WordBreakIITestCase: TestCase {
    public var name: String = "Word Break II"
    let s: String
    let words: [String]
    var result = [String]()
    
    init(s: String, words: [String]) {
        self.s = s
        self.words = words
    }
    
    public func run() {
        result = wordBreak(s, words)
    }
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        let chars = Array(s)
        var dict = [Int: [String]]()
        var arr = Array(repeating: false, count: s.count)
        for i in 0..<chars.count {
            for j in 0...i {
                if (j == 0 || arr[j - 1]) {
                    let substr = String(chars[j...i])
                    if wordDict.contains(substr) {
                        arr[i] = true
                        if dict[i] == nil {
                            dict[i] = [substr]
                        } else {
                            dict[i]!.append(substr)
                        }
                        break
                    }
                }
            }
        }
        return [String]()
    }
    
    public static func test() -> Bool {
        let test = WordBreakIITestCase(s: "pineapplepenapple", words: ["apple","pen","applepen","pine","pineapple"])
        test.run()
        return test.result == ["pine apple pen apple","pineapple pen apple","pine applepen apple"]
    }
}
