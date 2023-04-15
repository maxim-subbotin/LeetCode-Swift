//
//  MaximumNumberPairsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 14.04.2023.
//

import Foundation

public class MaximumNumberPairsTestCase: TestCase {
    public var name: String = "Maximum Number of Pairs in Array"
    let nums: [Int]
    var result = [Int]()
    
    init(nums: [Int]) {
        self.nums = nums
    }
    
    public func run() {
        result = numberOfPairs(nums)
    }
    
    func numberOfPairs(_ nums: [Int]) -> [Int] {
        var stat = Array(repeating: 0, count: 101)
        for i in 0..<nums.count {
            stat[nums[i]] += 1
        }
        var s = 0
        var d = 0
        for i in 0..<stat.count {
            if stat[i] != 0 {
                s += stat[i] / 2
                d += stat[i] % 2
            }
        }
        return [s, d]
    }
    
    public static func test() -> Bool {
        let test = MaximumNumberPairsTestCase(nums: [1,3,2,1,3,2,2])
        test.run()
        return test.result == [3,1]
    }
}
