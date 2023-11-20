//
//  MinimumSumFourDigitNumberSplittingTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 02.06.2023.
//

import Foundation

public class MinimumSumFourDigitNumberSplittingDigitsTestCase: TestCase {
    public var name: String = "Minimum Sum of Four Digit Number After Splitting Digits"
    let number: Int
    var result = 0
    
    init(number: Int) {
        self.number = number
    }
    
    public func run() {
        result = minimumSum(number)
    }
    
    func minimumSum(_ num: Int) -> Int {
        var digits = [Int]()
        var c = num
        while c > 0 {
            let d = c % 10
            digits.append(d)
            c = c / 10
        }
        digits.sort()
        let a = digits[0] * 10 + digits[3]
        let b = digits[1] * 10 + digits[2]
        return a + b
    }
    
    public static func test() -> Bool {
        let test = MinimumSumFourDigitNumberSplittingDigitsTestCase(number: 2932)
        test.run()
        return test.result == 52
    }
}
