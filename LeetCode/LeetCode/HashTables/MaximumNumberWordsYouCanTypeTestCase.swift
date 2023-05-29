//
//  MaximumNumberWordsYouCanTypeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 17.05.2023.
//

import Foundation

public class MaximumNumberWordsYouCanTypeTestCase: TestCase {
    public var name: String = "Maximum Number of Words You Can Type"
    let array: String
    let broken: String
    var result = 0
    
    init(array: String, broken: String) {
        self.array = array
        self.broken = broken
    }
    
    public func run() {
        result = canBeTypedWords(array, broken)
    }
    
    func canBeTypedWords(_ text: String, _ brokenLetters: String) -> Int {
        let words = text.components(separatedBy: .whitespaces)
        let banned = Set(brokenLetters)
        var s = 0
        for word in words {
            if banned.intersection(word).count == 0 {
                s += 1
            }
        }
        return s
    }
    
    public static func test() -> Bool {
        let test = MaximumNumberWordsYouCanTypeTestCase(array: "call me ishmael", broken: "ai")
        test.run()
        return test.result == 1
    }
}
