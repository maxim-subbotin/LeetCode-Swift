//
//  CharactersHaveEqualNumberTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 13.04.2023.
//

import Foundation

public class CharactersHaveEqualNumberTestCase: TestCase {
    public var name: String = "Check if All Characters Have Equal Number of Occurrences"
    let string: String
    var result = false
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = areOccurrencesEqual(string)
    }
    
    func areOccurrencesEqual(_ s: String) -> Bool {
        let arr = [UInt8](s.utf8)
        var stat = Array(repeating: 0, count: 26)
        var last = 0
        for i in 0..<s.count {
            stat[Int(arr[i]) - 97] += 1
            last = stat[Int(arr[i]) - 97]
        }
        for i in 0..<stat.count {
            if stat[i] != 0 && stat[i] != last {
                return false
            }
        }
        return true
    }
    
    public static func test() -> Bool {
        let test = CharactersHaveEqualNumberTestCase(string: "vvvvvvvv")
        test.run()
        return test.result == true
    }
}
