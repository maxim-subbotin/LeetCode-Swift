//
//  MaximumNumberWordsInSentencesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 02.05.2023.
//

import Foundation

public class MaximumNumberWordsFoundInSentencesTestCase: TestCase {
    public var name: String = "Maximum Number of Words Found in Sentences"
    let strings: [String]
    var result = 0
    
    init(strings: [String]) {
        self.strings = strings
    }
    
    public func run() {
        result = mostWordsFound(strings)
    }
    
    func mostWordsFound(_ sentences: [String]) -> Int {
        var m = 0
        for sentence in sentences {
            var chars = Array(sentence)
            var prevChar = chars[0]
            var wordCount = 0
            for i in 1..<chars.count {
                if chars[i] == " " && prevChar != " " {
                    wordCount += 1
                }
                prevChar = chars[i]
            }
            m = max(m, wordCount + 1)
        }
        return m
    }
    
    public static func test() -> Bool {
        let test = MaximumNumberWordsFoundInSentencesTestCase(strings: ["alice and bob love leetcode", "i think so too", "this is great thanks very much"])
        test.run()
        return test.result == 6
    }
}
