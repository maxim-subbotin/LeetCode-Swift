//
//  PowerOfTwoTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 21.03.2023.
//

import Foundation

public class PowerOfTwoTestCase: TestCase {
    public var name: String = "Power of Two"
    var n: Int
    var result = false
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = isPowerOfTwo(n)
    }
    
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 { return false }
        var x = n
        while x > 0 {
            let d = x % 2
            if d != 0 && x > 1 {
                return false
            }
            x = x / 2
        }
        return true
    }
    
    public static func test() -> Bool {
        let test = PowerOfTwoTestCase(n: 31)
        test.run()
        return test.result == false
    }
}
