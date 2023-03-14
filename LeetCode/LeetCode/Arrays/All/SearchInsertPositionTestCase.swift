//
//  SearchInsertPositionTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 28.02.2023.
//

import Foundation

public class SearchInsertPositionTestCase: TestCase {
    public var name = "Search Insert Position"
    var array: [Int]
    var result = -1
    var target: Int
    
    init(array: [Int], targer: Int) {
        self.array = array
        self.target = targer
    }
    
    public func run() {
        result = searchInsert(array, target)
    }
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if let first = nums.first, target < first { return 0 }
        if let last = nums.last, target > last { return nums.count }
        var start = 0
        var end = nums.count - 1
        while start < end {
            let mid: Int = (start + end) / 2
            if target == nums[mid] {
                return mid
            } else if target < nums[mid] {
                end = mid
            } else {
                start = mid
            }
            if end == start + 1 {
                if nums[start] == target {
                    return start
                } else if nums[end] == target {
                    return end
                }
                return end
            }
        }
        return start
    }
    
    public static func test() -> Bool {
        let array = [1,3,5]
        let test = SearchInsertPositionTestCase(array: array, targer: 1)
        test.run()
        return test.result == 0
    }
}
