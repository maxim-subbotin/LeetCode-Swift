//
//  SelfDividingNumbersTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 20.05.2023.
//

import Foundation

public class SelfDividingNumbersTestCase: TestCase {
    public var name: String = "Self Dividing Numbers"
    let left: Int
    let right: Int
    var result = [Int]()
    
    init(left: Int, right: Int) {
        self.left = left
        self.right = right
    }
    
    public func run() {
        result = selfDividingNumbers(left, right)
    }
    
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        (left...right).compactMap { isSelfDividing($0) ? $0 : nil }
    }
    
    func isSelfDividing(_ num: Int) -> Bool {
        var n = num
        while n > 9 {
            let d = n % 10
            if d == 0 {
                return false
            }
            if num % d != 0 {
                return false
            }
            n = n / 10
        }
        if num % n != 0 {
            return false
        }
        return true
    }
    
    public static func test() -> Bool {
        let test = SelfDividingNumbersTestCase(left: 1, right: 22)
        test.run()
        return test.result == [1,2,3,4,5,6,7,8,9,11,12,15,22]
    }
}
