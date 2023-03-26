//
//  NumberOfDigitOneTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 21.03.2023.
//

import Foundation

public class NumberOfDigitOneTestCase: TestCase {
    public var name: String = "Number of Digit One"
    var n: Int
    var result: Int = 0
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = countDigitOne(n)
    }
    
    func countDigitOne(_ n: Int) -> Int {
        var s = 0
        var i = 1
        while i <= n {
            let d = i * 10
            s += (n / d) * i + min(max(n % d - i + 1, 0), i)
            i = d
        }
        return s
    }
    
    public static func test() -> Bool {
        let test = NumberOfDigitOneTestCase(n: 13)
        test.run()
        return test.result == 6
    }
}
