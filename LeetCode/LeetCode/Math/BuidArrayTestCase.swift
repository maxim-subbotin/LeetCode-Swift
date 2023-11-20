//
//  BuidArrayTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 07.10.2023.
//

import Foundation

public class BuildArrayTestCase: TestCase {
    public var name: String = "Build Array Where You Can Find The Maximum Exactly K Comparisons"
    let n: Int
    let m: Int
    let k: Int
    var result = 0
    
    init(n: Int, m: Int, k: Int) {
        self.n = n
        self.m = m
        self.k = k
    }
    
    public func run() {
        result = numOfArrays(n, m, k)
    }
    
    func numOfArrays(_ n: Int, _ m: Int, _ k: Int) -> Int {
        let mod = 1_000_000_007
        var dp = Array(repeating: Array(repeating: 0, count: k + 1), count: m + 1)
        var prefix = Array(repeating: Array(repeating: 0, count: k + 1), count: m + 1)
        var prevDp = Array(repeating: Array(repeating: 0, count: k + 1), count: m + 1)
        var prevPref = Array(repeating: Array(repeating: 0, count: k + 1), count: m + 1)
        for i in 1...m {
            prevDp[i][1] = 1
            prevPref[i][1] = i
        }
        for i in 2...n {
            dp = Array(repeating: Array(repeating: 0, count: k + 1), count: m + 1)
            prefix = Array(repeating: Array(repeating: 0, count: k + 1), count: m + 1)
            for j in 1...m {
                for c in 1...k {
                    dp[j][c] = j * prevDp[j][c] % mod
                    if j > 1 && c > 1 {
                        dp[j][c] = (dp[j][c] + prevPref[j - 1][c - 1]) % mod
                    }
                    prefix[j][c] = (prefix[j - 1][c] + dp[j][c]) % mod
                }
            }
            prevDp = dp
            prevPref = prefix
        }
        return prefix[m][k]
    }
    
    public static func test() -> Bool {
        let test = BuildArrayTestCase(n: 50, m: 100, k: 25)
        test.run()
        return test.result == 34549172
    }
}
