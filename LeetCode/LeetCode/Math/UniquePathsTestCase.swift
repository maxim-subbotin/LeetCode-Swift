//
//  UniquePathsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 14.03.2023.
//

import Foundation

public class UniquePathsTestCase: TestCase {
    public var name: String = "Unique PathsTest"
    let m: Int
    let n: Int
    var result = 0
    
    init(m: Int, n: Int) {
        self.m = m
        self.n = n
    }
    
    public func run() {
        result = uniquePaths(m, n)
    }
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 1 || n == 1 {
            return 1
        }
        let total = m + n - 2
        let c = m - 1
        var r: Double = 1
        for i in 1...c {
            r = r * Double(total + i - c) / Double(i)
        }
        return Int(r)
    }
    
    public static func test() -> Bool {
        let test = UniquePathsTestCase(m: 3, n: 7)
        test.run()
        return test.result == 28
    }
}
