//
//  ThirdMaximumNumberTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/27/20.
//

import Foundation

public class ThirdMaximumNumberTestCase: TestCase {
    public var name: String = "Third Maximum Number"
    var array: [Int]
    var result = 0
    
    init(withArray arr: [Int]) {
        self.array = arr
    }
    
    public func run() {
        result = thirdMax(array)
    }
    
    func thirdMax(_ nums: [Int]) -> Int {
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.min
        
        for i in 0..<nums.count {
            if nums[i] > max1 {
                max3 = max2
                max2 = max1
                max1 = nums[i]
            } else if nums[i] < max1 && nums[i] > max2 {
                max3 = max2
                max2 = nums[i]
            } else if nums[i] < max2 && nums[i] > max3 {
                max3 = nums[i]
            }
        }
        
        if max3 == Int.min {
            return max1
        }
        return max3
    }
    
    public static func test() -> Bool {
        let testData = [3,2,5,6,2,6,8,9,4,7]
        let test = ThirdMaximumNumberTestCase(withArray: testData)
        test.run()
        return test.result == 7
    }
}
