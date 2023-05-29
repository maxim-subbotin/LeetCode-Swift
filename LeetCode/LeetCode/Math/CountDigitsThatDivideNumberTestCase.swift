//
//  CountDigitsThatDivideNumberTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 20.05.2023.
//

import Foundation

public class CountDigitsThatDivideNumberTestCase: TestCase {
    public var name: String = "Count the Digits That Divide a Number"
    let n: Int
    var result = 0
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = countDigits(n)
    }
    
    func countDigits(_ num: Int) -> Int {
        var n = num
        var s = 0
        while n > 9 {
            let d = n % 10
            if d == 1 || num % d == 0 {
                s += 1
            }
            n = n / 10
        }
        if n == 1 || num % n == 0 {
            s += 1
        }
        return s
    }
    
    public static func test() -> Bool {
        let test = CountDigitsThatDivideNumberTestCase(n: 121)
        test.run()
        return test.result == 2
    }
}
