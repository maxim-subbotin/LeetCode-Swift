//
//  MaximumValueOrderedTripletTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 08.10.2023.
//

import Foundation

public class MaximumValueOrderedTripletTestCase: TestCase {
    public var name: String = "Maximum Value of an Ordered Triplet I"
    let nums: [Int]
    var result = 0
    
    init(nums: [Int]) {
        self.nums = nums
    }
    
    public func run() {
        result = maximumTripletValue(nums)
    }
    
    func maximumTripletValue(_ nums: [Int]) -> Int {
        if nums.count == 3 {
            let v = (nums[0] - nums[1]) * nums[2]
            return v >= 0 ? v : 0
        }
        var result = 0
        var maxMult = 0
        var maxSub = 0
        for n in nums {
            result = max(result, maxSub * n)
            maxSub = max(maxSub, maxMult - n)
            maxMult = max(maxMult, n)
        }
        return result
    }
    
    public static func test() -> Bool {
        var cases = [([12,6,1,2,7], 77), ([1,10,3,4,19], 133), ([1,2,3],0), ([1,2,3,4,5,6],0), ([10,3,4,89,93,2,4,12,3], 1092), ([6,14,20,19,19,10,3,15,12,13,8,1,2,15,3], 285)]
        var result = true
        for c in cases {
            let test = MaximumValueOrderedTripletTestCase(nums: c.0)
            test.run()
            if test.result != c.1 {
                result = false
                print("Error on case: \(c.0). Answer: \(test.result), Correct: \(c.1)")
                // break
            }
        }
        return result
    }
}
