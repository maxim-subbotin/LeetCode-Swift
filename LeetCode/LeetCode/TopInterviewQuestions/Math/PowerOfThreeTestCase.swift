//
//  PowerOfThreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 05.11.2020.
//

import Foundation

public class PowerOfThreeTestCase: TestCase {
    public var name: String = "Power of Three"
    var n: Int
    var result = false
    
    init(withN n: Int) {
        self.n = n
    }
    
    public func run() {
        result = isPowerOfThree(n)
    }
    
    func isPowerOfThree(_ n: Int) -> Bool {
        if n < 1 {
            return false
        }

        var k = n
        while k % 3 == 0 {
            k /= 3;
        }

        return k == 1
    }
    
    public static func test() -> Bool {
        let test = PowerOfThreeTestCase(withN: 27)
        test.run()
        return test.result
    }
}
