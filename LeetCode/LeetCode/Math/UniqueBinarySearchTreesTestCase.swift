//
//  UniqueBinarySearchTreesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 18.03.2023.
//

import Foundation

public class UniqueBinarySearchTreesTestCase: TestCase {
    public var name: String = "Unique Binary Search Trees"
    var n: Int
    var result = 0
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = numTrees(n)
    }
    
    func numTrees(_ n: Int) -> Int {
        if n < 2 {
            return 1
        }
        var res = Array(repeating: 0, count: n + 1)
        res[0] = 1
        res[1] = 1
        for i in 2...n {
            for j in 1...i {
                res[i] += res[j - 1] * res[i - j]
            }
        }
        return res[n]
    }
    
    public static func test() -> Bool {
        let test = UniqueBinarySearchTreesTestCase(n: 3)
        test.run()
        return test.result == 5
    }
}
