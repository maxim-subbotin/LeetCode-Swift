//
//  FibonacciNumberTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 29.04.2023.
//

import Foundation

public class FibonacciNumberTestCase: TestCase {
    public var name: String = "Fibonacci Number"
    let n: Int
    var result = 0
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = fib(n)
    }
    
    func fib(_ n: Int) -> Int {
        if n < 2 { return n }
        var p1 = 0
        var p2 = 1
        for _ in 2...n {
            let p3 = p1 + p2
            p1 = p2
            p2 = p3
        }
        return p2
    }
    
    public static func test() -> Bool {
        let test = FibonacciNumberTestCase(n: 6)
        test.run()
        return test.result == 8
    }
}
