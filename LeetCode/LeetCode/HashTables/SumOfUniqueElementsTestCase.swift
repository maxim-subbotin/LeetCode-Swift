//
//  SumOfUniqueElementsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 13.04.2023.
//

import Foundation

public class SumOfUniqueElementsTestCase: TestCase {
    public var name: String = "Sum of Unique Elements"
    let nums: [Int]
    var result = 0
    
    init(nums: [Int]) {
        self.nums = nums
    }
    
    public func run() {
        result = sumOfUnique(nums)
    }
    
    func sumOfUnique(_ nums: [Int]) -> Int {
        var stat = Array(repeating: 0, count: 101)
        var sum = 0
        for i in 0..<nums.count {
            stat[nums[i]] += 1
            if stat[nums[i]] == 1 {
                sum += nums[i]
            } else if stat[nums[i]] == 2 {
                sum -= nums[i]
            }
        }
        /*var sum = 0
        for i in 0..<stat.count {
            if stat[i] == 1 {
                sum += i
            }
        }*/
        return sum
    }
    
    public static func test() -> Bool {
        let test = SumOfUniqueElementsTestCase(nums: [1,3,3,2,4,4,5,5])
        test.run()
        return test.result == 3
    }
}
