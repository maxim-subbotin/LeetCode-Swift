//
//  SortingSentenceTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 03.05.2023.
//

import Foundation

public class SortingSentenceTestCase: TestCase {
    public var name: String = "Sorting the Sentence"
    let string: String
    var result = ""
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = sortSentence(string)
    }
    
    func sortSentence(_ s: String) -> String {
        let chars = Array(s)
        var buffer = [Character]()
        var dict = [Int: String]()
        var max = 0
        for i in 0..<chars.count {
            if chars[i] == " " {
                buffer = []
            } else if chars[i].isNumber, let n = Int(String(chars[i])) {
                dict[n] = String(buffer)
                max += 1
            } else {
                buffer.append(chars[i])
            }
        }
        var start = dict[1]!
        if max > 1 {
            for i in 2...max {
                start.append(" ")
                start.append(dict[i]!)
            }
        }
        return start
    }
    
    public static func test() -> Bool {
        let test = SortingSentenceTestCase(string: "Myself2 Me1 I4 and3")
        test.run()
        return test.result == "Me Myself and I"
    }
}
