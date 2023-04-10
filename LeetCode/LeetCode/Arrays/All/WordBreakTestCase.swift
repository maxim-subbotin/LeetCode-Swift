//
//  WordBreakTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 04.04.2023.
//

import Foundation

public class WordBreakTestCase: TestCase {
    public var name: String = "Word Break"
    let s: String
    let words: [String]
    var result = false
    
    init(s: String, words: [String]) {
        self.s = s
        self.words = words
    }
    
    public func run() {
        result = wordBreak(s, words)
    }
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        /*
         catsandog
         c          - no
         ca         - no
         cat        - yes
         cats       - yes
         catsa      - no
         catsan     - no
         catsand    - yes
         ...
         */
        let chars = Array(s)
        var arr = Array(repeating: false, count: s.count)
        for i in 0..<chars.count {
            for j in 0...i {
                if (j == 0 || arr[j - 1]) && wordDict.contains(String(chars[j...i])) {
                    arr[i] = true
                    break
                }
            }
        }
        return arr[arr.count - 1]
    }
    
    public static func test() -> Bool {
        let test = WordBreakTestCase(s: "catsandog", words: ["cats","dog","sand","and","cat"])
        test.run()
        return test.result == false
    }
}
