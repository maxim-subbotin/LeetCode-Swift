//
//  FizzBuzzTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 03.11.2020.
//

import Foundation

public class FizzBussTestCase: TestCase {
    public var name: String = "Fizz Buzz"
    var n: Int
    var result = [String]()
    
    init(withN n: Int) {
        self.n = n
    }
    
    public func run() {
        result = fizzBuzz(n)
    }
    
    func fizzBuzz(_ n: Int) -> [String] {
        if n == 0 {
            return [String]()
        }
        var strs = [String]()
        var threeIndex = 1
        var fiveIndex = 1
        for i in 1...n {
            if threeIndex == 3 && fiveIndex == 5 {
                strs.append("FizzBuzz")
                threeIndex = 0
                fiveIndex = 0
            } else if threeIndex == 3 {
                strs.append("Fizz")
                threeIndex = 0
            } else if fiveIndex == 5 {
                strs.append("Buzz")
                fiveIndex = 0
            } else {
                strs.append("\(i)")
            }
            
            threeIndex += 1
            fiveIndex += 1
        }
        return strs
    }
    
    public static func test() -> Bool {
        let test = FizzBussTestCase(withN: 15)
        test.run()
        return test.result == ["1",
                               "2",
                               "Fizz",
                               "4",
                               "Buzz",
                               "Fizz",
                               "7",
                               "8",
                               "Fizz",
                               "Buzz",
                               "11",
                               "Fizz",
                               "13",
                               "14",
                               "FizzBuzz"]
    }
}
