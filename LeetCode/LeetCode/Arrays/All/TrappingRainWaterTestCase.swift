//
//  TrappingRainWaterTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 28.03.2023.
//

import Foundation

public class TrappingRainWaterTestCase: TestCase {
    public var name: String = "Trapping Rain Water"
    let nums: [Int]
    var result = 0
    
    init(nums: [Int]) {
        self.nums = nums
    }
    
    public func run() {
        result = trap(nums)
    }
    
    func trap(_ height: [Int]) -> Int {
        let n = height.count
        var left = Array(repeating: 0, count: n)
        var right = Array(repeating: 0, count: n)
        left[0] = height[0]
        right[n - 1] = height[n - 1]
        for i in 1..<n {
            left[i] = max(height[i], left[i - 1])
        }
        if n > 1 {
            for i in (0...(n - 2)).reversed() {
                right[i] = max(height[i], right[i + 1])
            }
        }
        var c = 0
        for i in 0..<n {
            let min = min(left[i], right[i])
            c += ((min - height[i]) > 0) ? (min - height[i]) : 0
        }
        return c
    }
    
    public static func test() -> Bool {
        let test = TrappingRainWaterTestCase(nums: [1, 5, 3, 0, 4, 0])
        test.run()
        return test.result == 1
    }
}
