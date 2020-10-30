//
//  StringToIntegerTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/30/20.
//

import Foundation

public class StringToIntegerTestCase: TestCase {
    public var name: String = "String to Integer (atoi)"
    var string: String
    var result = -1
    
    init(withString s: String) {
        self.string = s
    }
    
    public func run() {
        result = myAtoi(string)
    }
    
    func myAtoi(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        var index = 0
        var sign = 1
        var sum = 0
        let chars = Array(s)
        
        let max = Int(Int32.max)
        let min = Int(Int32.min)
        
        while index < s.count && chars[index].isWhitespace {
            index += 1
        }
        if index < s.count && (chars[index] == "+" || chars[index] == "-") {
            sign = chars[index] == "-" ? -1 : 1
            index += 1
        }
        
        while index < s.count && chars[index].isNumber {
            let n = (chars[index].asciiValue ?? 0) - 48
            if sum > max / 10 || (sum == max / 10 && n > max % 10) {
                return (sign == 1) ? max : min
            }
            sum = sum * 10 + Int(n)
            index += 1
        }
        
        return sum * sign
    }
    
    /*func myAtoi(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        var isNegative = false
        let chars = Array(s)
        var index = 0
        var isSpace = chars[0].isWhitespace
        while index < s.count - 1 && isSpace {
            index += 1
            isSpace = chars[index].isWhitespace
        }
        if index == s.count {
            return 0
        }
        
        if chars[index] == "-" {
            isNegative = true
            index += 1
        } else if chars[index] == "+" {
            index += 1
        }
        var digits = [UInt8]()
        while index < s.count && chars[index].isNumber {
            let n = (chars[index].asciiValue ?? 0) - 48
            digits.append(n)
            index += 1
        }
        
        var sum: Int64 = 0
        var dec: Int64 = 1
        for i in 0..<digits.count {
            sum += Int64(digits[digits.count - 1 - i]) * dec
            if isNegative && -sum < Int32.min {
                return Int(Int32.min)
            } else if !isNegative && sum > Int32.max {
                return Int(Int32.max)
            }
            dec *= 10
        }

        if isNegative {
            return Int(-sum)
        }
        return Int(sum)
    }*/
    
    public static func test() -> Bool {
        let test = StringToIntegerTestCase(withString: "   -545675757736  ")
        test.run()
        return test.result == 12345
    }
}
