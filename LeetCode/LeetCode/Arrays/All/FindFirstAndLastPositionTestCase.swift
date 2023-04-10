//
//  FindFirstAndLastPositionTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 26.03.2023.
//

import Foundation

public class FindFirstAndLastPositionTestCase: TestCase {
    public var name: String = "Find First and Last Position"
    let array: [Int]
    let n: Int
    var result = [Int]()
    
    init(array: [Int], n: Int) {
        self.array = array
        self.n = n
    }
    
    public func run() {
        result = searchRange(array, n)
    }
    
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 0 || target < nums[0] || target > nums[nums.count - 1] {
            return [-1, -1]
        }
        var start = -1
        var end = -1
        find(.start, nums: nums, target: target, start: 0, end: nums.count - 1, index: &start)
        find(.stop, nums: nums, target: target, start: 0, end: nums.count - 1, index: &end)
        return [start, end]
    }
    
    enum Direction {
        case stop
        case start
    }
    
    func find(_ direction: Direction, nums: [Int], target: Int, start: Int, end: Int, index: inout Int) {
        if start > end {
            return
        }
        let mid = (start + end) / 2
        if nums[mid] == target {
            index = mid
        }
        if direction == .start {
            if nums[mid] >= target {
                find(direction, nums: nums, target: target, start: start, end: mid - 1, index: &index)
            } else {
                find(direction, nums: nums, target: target, start: mid + 1, end: end, index: &index)
            }
        } else {
            if nums[mid] <= target {
                find(direction, nums: nums, target: target, start: mid + 1, end: end, index: &index)
            } else {
                find(direction, nums: nums, target: target, start: start, end: mid - 1, index: &index)
            }
        }
    }
    
    public static func test() -> Bool {
        let test = FindFirstAndLastPositionTestCase(array: [5,7,7,8,8,10], n: 8)
        test.run()
        return test.result == [3,4]
    }
}
