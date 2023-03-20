//
//  FactorialTrailingZeroesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 19.03.2023.
//

import Foundation

public class FactorialTrailingZeroesTestCase: TestCase {
    public var name: String = "Factorial Trailing Zeroes"
    var n: Int
    var result = 0
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = trailingZeroes(n)
    }
    
    func trailingZeroes(_ n: Int) -> Int {
        var c = 0
        var i = 5
        while i <= n {
            var x = i
            while x % 5 == 0 {
                x = x / 5
                c += 1
            }
            i += 5
        }
        return c
    }
    
    public static func test() -> Bool {
        let test = FactorialTrailingZeroesTestCase(n: 5)
        test.run()
        return test.result == 1
    }
}
