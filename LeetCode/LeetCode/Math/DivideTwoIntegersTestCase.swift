//
//  DivideTwoIntegersCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 12.03.2023.
//

import Foundation

public class DivideTwoIntegersTestCase: TestCase {
    public var name: String = "Divide Two Integers"
    let dividend: Int
    let divisor: Int
    var result = 0
    
    init(dividend: Int, divisor: Int) {
        self.dividend = dividend
        self.divisor = divisor
    }
    
    public func run() {
        result = divide(dividend, divisor)
    }
    
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let s = sign(dividend) * sign(divisor)
        var a = abs(dividend)
        let b = abs(divisor)
        var v = 0
        if b == 1 {
            v = a
        } else {
            while a >= b {
                a -= b
                v += 1
            }
        }
        let maxV = 2147483647
        let minV = -2147483648
        return max(min(s * v, maxV), minV)
    }
    
    func sign(_ a: Int) -> Int {
        a < 0 ? -1 : 1
    }
    
    public static func test() -> Bool {
        let test = DivideTwoIntegersTestCase(dividend: 10, divisor: 3)
        test.run()
        return test.result == 3
    }
}
