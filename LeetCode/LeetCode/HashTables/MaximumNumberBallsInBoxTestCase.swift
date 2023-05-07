//
//  MaximumNumberBallsInBoxTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 01.05.2023.
//

import Foundation

public class MaximumNumberBallsInBoxTestCase: TestCase {
    public var name: String = "Maximum Number of Balls in a Box"
    let from: Int
    let to: Int
    var result = 0
    
    init(from: Int, to: Int) {
        self.from = from
        self.to = to
    }
    
    public func run() {
        result = countBalls(from, to)
    }
    
    func countBalls(_ lowLimit: Int, _ highLimit: Int) -> Int {
        var dict = [Int: Int]()
        var m = 1
        for i in lowLimit...highLimit {
            let s = sumOfDigits(n: i)
            if dict[s] == nil {
                dict[s] = 1
            } else {
                dict[s]! += 1
                m = max(m, dict[s]!)
            }
        }
        return m
    }
    
    func sumOfDigits(n: Int) -> Int {
        var s = 0
        var x = n
        while x >= 10 {
            s += x % 10
            x = x / 10
        }
        s += x
        return s
    }
    
    public static func test() -> Bool {
        let test = MaximumNumberBallsInBoxTestCase(from: 1, to: 10)
        test.run()
        return test.result == 2
    }
}
