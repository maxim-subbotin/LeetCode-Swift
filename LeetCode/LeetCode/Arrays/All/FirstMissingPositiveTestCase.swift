//
//  FirstMissingPositiveTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 28.03.2023.
//

import Foundation

public class FirstMissingPositiveTestCase: TestCase {
    public var name: String = "First Missing Positive"
    let nums: [Int]
    var result = 0
    
    init(nums: [Int]) {
        self.nums = nums
    }
    
    public func run() {
        result = firstMissingPositive(nums)
    }
    
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var nums = nums
        var i = 0
        while i < nums.count {
            var n = nums[i]
            if n >= 1 && n <= nums.count {
                if nums[n - 1] != n {
                    nums[i] = nums[n - 1]
                    nums[n - 1] = n
                } else {
                    i += 1
                }
            } else {
                i += 1
            }
        }
        for i in 0..<nums.count {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return nums.count + 1
    }
    
    public static func test() -> Bool {
        let test = FirstMissingPositiveTestCase(nums: [7,8,9,11,12,1])
        test.run()
        return test.result == 2
    }
}
