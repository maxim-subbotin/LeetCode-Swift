//
//  CountAsterisksTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 04.05.2023.
//

import Foundation

public class CountAsterisksTestCase: TestCase {
    public var name: String = "Count Asterisks"
    let str: String
    var result = 0
    
    init(str: String) {
        self.str = str
    }
    
    public func run() {
        result = countAsterisks(str)
    }
    
    func countAsterisks(_ s: String) -> Int {
        var n = 0
        var iterator = s.makeIterator()
        var mustCount = true
        var k = 0
        while let c = iterator.next() {
            if c == "|" {
                k += 1
                mustCount = k % 2 == 0
            } else if mustCount && c == "*" {
                n += 1
            }
        }
        return n
    }
    
    public static func test() -> Bool {
        let test = CountAsterisksTestCase(str: "*||*|||||*|*|***||*||***|")
        test.run()
        return test.result == 3
    }
}
