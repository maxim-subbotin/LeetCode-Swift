//
//  MinimumRightShiftsSortArrayTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 09.10.2023.
//

import Foundation

public class MinimumRightShiftsSortArrayTestCase: TestCase {
    public var name: String = "Minimum Right Shifts to Sort the Array"
    var result = 0
    var nums: [Int]
    
    init(nums: [Int]) {
        self.nums = nums
    }
    
    public func run() {
        result = minimumRightShifts(nums)
    }
    
    func minimumRightShifts(_ nums: [Int]) -> Int {
        if nums.count == 1 { return 0 }
        if nums.count == 2 { return nums[0] < nums[1] ? 0 : 1 }
        var firstPart = [Int]()
        firstPart.append(nums[0])
        for i in 1..<nums.count {
            if nums[i] > firstPart.last! {
                firstPart.append(nums[i])
            } else {
                break
            }
        }
        if firstPart.count == nums.count {
            return 0
        }
        var secondPart = [Int]()
        secondPart.append(nums[firstPart.count])
        for i in (firstPart.count + 1)..<nums.count {
            if nums[i] > secondPart.last! {
                secondPart.append(nums[i])
            } else {
                break
            }
        }
        if firstPart.count + secondPart.count == nums.count && secondPart.last! < firstPart.first! {
            return secondPart.count
        } else {
            return -1
        }
    }
    
    public static func test() -> Bool {
        let test = MinimumRightShiftsSortArrayTestCase(nums: [2,1,4])
        test.run()
        return test.result == -1
    }
}
