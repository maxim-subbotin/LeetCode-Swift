//
//  RomanToIntegerTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 05.11.2020.
//

import Foundation

public class RomanToIntegerTestCase: TestCase {
    public var name: String = "Roman to Integer"
    var roman: String
    var result = 0
    
    init(withRoman r: String) {
        self.roman = r
    }
    
    public func run() {
        result = romanToInt(roman)
    }
    
    func romanToInt(_ s: String) -> Int {
        let map: [Character:Int] = ["I": 1,
                                   "V": 5,
                                   "X": 10,
                                   "L": 50,
                                   "C": 100,
                                   "D": 500,
                                   "M": 1000]
        let chars = Array(s)
        
        if chars.count == 1 {
            return map[chars[0]] ?? 0
        }
        
        var sum = 0
        var i = 0
        while i <= (chars.count - 2) {
            if chars[i] == "I" {
                if chars[i + 1] == "V" {
                    sum += 4
                    i += 2
                } else if chars[i + 1] == "X" {
                    sum += 9
                    i += 2
                } else {
                    sum += 1
                    i += 1
                }
            } else if chars[i] == "X" {
                if chars[i + 1] == "L" {
                    sum += 40
                    i += 2
                } else if chars[i + 1] == "C" {
                    sum += 90
                    i += 2
                } else {
                    sum += 10
                    i += 1
                }
            } else if chars[i] == "C" {
                if chars[i + 1] == "D" {
                    sum += 400
                    i += 2
                } else if chars[i + 1] == "M" {
                    sum += 900
                    i += 2
                } else {
                    sum += 100
                    i += 1
                }
            } else {
                sum += (map[chars[i]] ?? 0)
                i += 1
            }
        }
        if i == chars.count - 1 {
            sum += (map[chars[chars.count - 1]] ?? 0)
        }
        return sum
    }
    
    public static func test() -> Bool {
        let test = RomanToIntegerTestCase(withRoman: "MMMCDXLIX")
        test.run()
        return test.result == 3449
    }
}
