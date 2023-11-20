//
//  WordPatternTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 12.11.2023.
//

import Foundation

public class WordPatternTestCase: TestCase {
    public var name: String = "Word Pattern"
    var result = false
    var pattern: String
    var s: String
    
    init(pattern: String, s: String) {
        self.pattern = pattern
        self.s = s
    }
    
    public func run() {
        result = wordPattern(pattern, s)
    }
    
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let words = s.components(separatedBy: " ")
        guard words.count == pattern.count else { return false }
        let chars = Array(pattern)
        var dict = [Character: String]()
        var uniqueWords = Set<String>()
        for i in 0..<chars.count {
            if let word = dict[chars[i]] {
                if word != words[i] {
                    return false
                }
            } else {
                if uniqueWords.contains(words[i]) {
                    return false
                } else {
                    dict[chars[i]] = words[i]
                    uniqueWords.insert(words[i])
                }
            }
        }
        return true
    }
    
    public static func test() -> Bool {
        // let test = WordPatternTestCase(pattern: "abba", s: "dog cat cat dog")
        let test = WordPatternTestCase(pattern: "abba", s: "dog dog dog dog")
        test.run()
        return test.result == true
    }
}
