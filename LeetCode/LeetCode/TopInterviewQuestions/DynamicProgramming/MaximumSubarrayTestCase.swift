//
//  MaximumSubarrayTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 18.11.2020.
//

import Foundation

public class MaximumSubarrayTestCase: TestCase {
    public var name: String = "Maximum Subarray"
    let nums: [Int]
    var result: Int = -1
    
    init(withNums ns: [Int]) {
        self.nums = ns
    }
    
    public func run() {
        result = maxSubArray(nums)
    }
    
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        
        var max = Int.min
        var maxRange = 0
        for i in 0..<nums.count {
            maxRange = maxRange + nums[i]
            if max < maxRange {
                max = maxRange
            }
            if maxRange < 0 {
                maxRange = 0
            }
        }
        return max
    }
    
    public static func test() -> Bool {
        let test = MaximumSubarrayTestCase(withNums: [-2,1,-3,4,-1,2,1,-5,4])
        test.run()
        return test.result == 6
    }
}
