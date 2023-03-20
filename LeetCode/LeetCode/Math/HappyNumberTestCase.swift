//
//  HappyNumberTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 20.03.2023.
//

import Foundation

public class HappyNumberTestCase: TestCase {
    public var name: String = "Happy Number"
    var n: Int
    var result: Bool = false
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = isHappy(n)
    }
    
    func isHappy(_ n: Int) -> Bool {
        var squares = Set<Int>()
        let isCycle = false
        var x = n
        while !isCycle {
            x = process(n: x)
            if x == 1 {
                return true
            } else if squares.contains(x) {
                return false
            } else {
                squares.insert(x)
            }
        }
    }
    
    func process(n: Int) -> Int {
        var s = 0
        var x = n
        while x > 0 {
            let i = x % 10
            s += i * i
            x = x / 10
        }
        return s
    }
    
    public static func test() -> Bool {
        let test = HappyNumberTestCase(n: 19)
        test.run()
        return test.result == true
    }
}
