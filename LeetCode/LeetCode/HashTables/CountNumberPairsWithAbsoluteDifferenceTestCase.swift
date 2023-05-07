//
//  CountNumberPairsWithAbsoluteDifferenceTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 01.05.2023.
//

import Foundation

public class CountNumberPairsWithAbsoluteDifferenceTestCase: TestCase {
    public var name: String = "Count Number of Pairs With Absolute Difference K"
    let array: [Int]
    let k: Int
    var result = 0
    
    init(array: [Int], k: Int) {
        self.array = array
        self.k = k
    }
    
    public func run() {
        result = countKDifference(array, k)
    }
    
    func countKDifference(_ nums: [Int], _ k: Int) -> Int {
        var dict = Array(repeating: 0, count: 101)
        for num in nums {
            dict[num] += 1
        }
        var sum = 0
        for num in nums {
            let a = num + k
            if a < dict.count {
                sum += dict[a]
                dict[a] = 0
            }
        }
        return sum
    }
    
    public static func test() -> Bool {
        let test = CountNumberPairsWithAbsoluteDifferenceTestCase(array: [3,2,1,5,4], k: 2)
        test.run()
        return test.result == 3
    }
}
