//
//  MostCommonWordTestCas.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 07.05.2023.
//

import Foundation

public class MostCommonWordTestCase: TestCase {
    public var name: String = "Most Common Word"
    let text: String
    let bannedWords: [String]
    var result = ""
    
    init(text: String, bannedWords: [String]) {
        self.text = text
        self.bannedWords = bannedWords
    }
    
    public func run() {
        result = mostCommonWord(text, bannedWords)
    }
    
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        let chars = Array(paragraph)
        let set = Set(banned)
        var dict = [String: Int]()
        var buffer = [Character]()
        var maxWord: String?
        var maxCount = 0
        for i in 0..<chars.count {
            if chars[i].isLetter {
                buffer.append(chars[i])
            } else if !buffer.isEmpty {
                let word = String(buffer).lowercased()
                if !set.contains(word) {
                    dict[word, default: 0] += 1
                    if dict[word]! > maxCount {
                        maxCount = dict[word]!
                        maxWord = word
                    }
                }
                buffer.removeAll()
            }
        }
        if !buffer.isEmpty {
            let word = String(buffer).lowercased()
            if !set.contains(word) {
                dict[word, default: 0] += 1
                if dict[word]! > maxCount {
                    maxCount = dict[word]!
                    maxWord = word
                }
            }
            buffer.removeAll()
        }
        return maxWord ?? ""
    }
    
    public static func test() -> Bool {
        let test = MostCommonWordTestCase(text: "Bob hit a ball, the hit BALL flew far after it was hit.", bannedWords: ["hit"])
        test.run()
        return test.result == "ball"
    }
}
