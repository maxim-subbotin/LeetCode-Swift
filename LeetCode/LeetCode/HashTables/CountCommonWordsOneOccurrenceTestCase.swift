//
//  CountCommonWordsOneOccurrenceTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 28.05.2023.
//

import Foundation

public class CountCommonWordsOneOccurrenceTestCase: TestCase {
    public var name: String = "Count Common Words With One Occurrence"
    let words1: [String]
    let words2: [String]
    var result = 0
    
    init(words1: [String], words2: [String]) {
        self.words1 = words1
        self.words2 = words2
    }
    
    public func run() {
        result = countWords(words1, words2)
    }
    
    func countWords(_ words1: [String], _ words2: [String]) -> Int {
        var stat = [String: Int]()
        for i in 0..<words1.count {
            if stat[words1[i]] != nil {
                stat[words1[i]] = 0
            } else {
                stat[words1[i]] = 1
            }
        }
        for i in 0..<words2.count {
            if stat[words2[i]] == 1 {
                stat[words2[i]] = 2
            } else {
                stat[words2[i]] = 10
            }
        }
        return stat.reduce(0, { $0 + ($1.value == 2 ? 1 : 0) })
    }
    
    public static func test() -> Bool {
        let test = CountCommonWordsOneOccurrenceTestCase(words1: ["leetcode","is","amazing","as","is"], words2: ["amazing","leetcode","is"])
        test.run()
        return test.result == 2
    }
}
