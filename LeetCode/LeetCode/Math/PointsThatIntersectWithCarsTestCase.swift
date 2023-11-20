//
//  PointsThatIntersectWithCarsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 12.10.2023.
//

import Foundation

public class PointsThatIntersectWithCarsTestCase: TestCase {
    public var name: String = "Points That Intersect With Cars"
    var result = 0
    var nums: [[Int]]
    
    init(nums: [[Int]]) {
        self.nums = nums
    }
    
    public func run() {
        result = numberOfPoints(nums)
    }
    
    struct Range {
        var from: Int
        var to: Int
    }
    
    func numberOfPoints(_ nums: [[Int]]) -> Int {
        if nums.count == 1 { return nums[0][1] - nums[0][0] + 1 }
        var ranges = [Range(from: nums[0][0], to: nums[0][1])]
        ranges.sort { $0.from < $1.from }
        for i in 1..<nums.count {
            let c = nums[i]
            var wasMerged = false
            for j in 0..<ranges.count {
                var range = ranges[j]
                if (c[0] >= range.from && c[0] <= range.to) ||
                    (c[1] >= range.from && c[1] <= range.to) ||
                    (c[0] >= range.from && c[1] <= range.to) ||
                    (c[0] <= range.from && c[1] >= range.to) {
                    range.from = min(range.from, c[0])
                    range.to = max(range.to, c[1])
                    ranges[j] = range
                    wasMerged = true
                    break
                }
            }
            if !wasMerged {
                ranges.append(Range(from: c[0], to: c[1]))
            }
        }
        return ranges.map { $0.to - $0.from + 1 }.reduce(0, +)
    }
    
    public static func test() -> Bool {
        let test = PointsThatIntersectWithCarsTestCase(nums: [[1,3],[2,4],[6,6],[6,9],[2,10],[4,10],[3,6],[1,4],[1,3]])
        test.run()
        return test.result == 10
    }
}
