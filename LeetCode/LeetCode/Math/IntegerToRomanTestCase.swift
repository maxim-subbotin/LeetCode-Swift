//
//  IntegerToRomanTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 12.03.2023.
//

import Foundation

public class IntegerToRomanTestCase: TestCase {
    public var name: String = "Integer to Roman"
    let val: Int
    var result = ""
    
    init(value: Int) {
        val = value
    }
    
    public func run() {
        result = intToRoman(val)
    }
    
    let dict = [
        1: "I",
        5: "V",
        10: "X",
        50: "L",
        100: "C",
        500: "D",
        1000: "M"
    ]
    
    let chs = [
        1: ("DCCCC", "CM"),
        2: ("CCCC", "CD"),
        3: ("LXXXX", "XC"),
        4: ("XXXX", "XL"),
        5: ("VIIII", "IX"),
        6: ("IIII", "IV")
    ]
    
    func intToRoman(_ num: Int) -> String {
        let divs = [1000, 500, 100, 50, 10, 5, 1]
        var a = num
        var stack = [String]()
        for d in divs {
            while a >= d {
                a -= d
                stack.append(dict[d]!)
            }
            // let n = a / d
            // stack.append(contentsOf: Array(repeating: dict[d]!, count: n))
            // a -= n * d
        }
        var s = stack.joined()
        for i in 1...6 {
            s = s.replacingOccurrences(of: chs[i]!.0, with: chs[i]!.1)
        }
        return s
    }
    
    public static func test() -> Bool {
        let test = IntegerToRomanTestCase(value: 123)
        test.run()
        return test.result == "CXXIII"
    }
}
