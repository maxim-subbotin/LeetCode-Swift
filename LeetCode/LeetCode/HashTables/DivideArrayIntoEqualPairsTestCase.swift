//
//  DivideArrayIntoEqualPairsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 15.04.2023.
//

import Foundation

public class DivideArrayIntoEqualPairsTestCase: TestCase {
    public var name: String = "Divide Array Into Equal Pairs"
    let nums: [Int]
    var result = false
    
    init(nums: [Int]) {
        self.nums = nums
    }
    
    public func run() {
        result = divideArray(nums)
    }
    
    func divideArray(_ nums: [Int]) -> Bool {
        var stat = Array(repeating: 0, count: 501)
        for i in 0..<nums.count {
            if stat[nums[i]] == 0 {
                stat[nums[i]] += 1
            } else {
                stat[nums[i]] -= 1
            }
        }
        for i in 0..<stat.count {
            if stat[i] != 0 {
                return false
            }
        }
        return true
    }
    
    public static func test() -> Bool {
        let test = DivideArrayIntoEqualPairsTestCase(nums: [3,2,3,2,2,2])
        test.run()
        return test.result == true
    }
}
