//
//  PerfectSquaresTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 24.03.2023.
//

import Foundation

public class PerfectSquaresTestCase: TestCase {
    public var name: String = "Perfect Squares"
    let n: Int
    var result = 0
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = numSquares(n)
    }
    
    func numSquares(_ n: Int) -> Int {
        var res = Array(repeating: Int.max, count: n + 1)
        res[0] = 0
        var s = 1
        var sq = 1
        while sq <= n {
            for i in sq...n {
                res[i] = min(res[i - sq] + 1, res[i])
            }
            s += 1
            sq = s * s
        }
        return res[n]
    }
    
    public static func test() -> Bool {
        let test = PerfectSquaresTestCase(n: 13)
        test.run()
        return test.result == 2
    }
}
