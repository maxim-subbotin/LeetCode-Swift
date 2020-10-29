//
//  ReverseIntegerTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/29/20.
//

import Foundation

public class ReverseIntegerTestCase: TestCase {
    public var name: String = "Reverse Integer"
    var value: Int
    var result = 0
    
    init(withValue v: Int) {
        value = v
    }
    
    public func run() {
        result = reverse(value)
    }
    
    func reverse(_ x: Int) -> Int {
        let min = -2147483648
        let max = 2147483647
        
        let isNegative = x < 0
        let chars = Array("\(abs(x))")
        var str = [Character]()
        var initialZeroes = false
        for i in (0..<chars.count).reversed() {
            if i == chars.count - 1 && chars[i] == "0" {
                initialZeroes = true
            } else if chars[i] != "0" {
                str.append(chars[i])
                initialZeroes = false
            } else if !initialZeroes {
                str.append(chars[i])
            }
        }
        if var v = Int(String(str)) {
            v *= (isNegative ? -1 : 1)
            if v < min || v > max {
                return 0
            } else {
                return v
            }
        }
        return 0
    }
    
    public static func test() -> Bool {
        let x = -102340 // 1534236469 -> 0
        let test = ReverseIntegerTestCase(withValue: x)
        test.run()
        return test.result == -43201
    }
}
