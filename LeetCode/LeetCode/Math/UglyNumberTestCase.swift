//
//  UglyNumberTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 23.03.2023.
//

import Foundation

public class UglyNumberTestCase: TestCase {
    public var name: String = "Ugly Number"
    var n: Int
    var result = false
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = isUgly(n)
    }
    
    func isUgly(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        var x = n
        for i in [2, 3, 5] {
            while x % i == 0 {
                x = x / i
            }
        }
        return x == 1
    }
    
    public static func test() -> Bool {
        let test = UglyNumberTestCase(n: 30)
        test.run()
        return test.result == true
    }
}
