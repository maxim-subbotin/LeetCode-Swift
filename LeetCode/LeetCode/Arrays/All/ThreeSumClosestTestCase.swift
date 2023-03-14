//
//  ThreeSumClosestTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 28.02.2023.
//

import Foundation

public class ThreeSumClosestTestCase: TestCase {
    public var name = "3Sum Closest"
    var array: [Int]
    var target: Int
    var result = -1
    
    init(array: [Int], target: Int) {
        self.array = array
        self.target = target
    }
    
    public func run() {
        result = threeSumClosest(array, target)
    }
    
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 { return 0 }
        var closest = Int.max
        var minDiff = Int.max
        let arr = nums.sorted()
        for i in 0..<nums.count - 2 {
            let k = target - arr[i]
            var low = i + 1
            var high = arr.count - 1
            while low < high {
                let s = arr[low] + arr[high]
                if s != k {
                    let sum = s + arr[i]
                    let diff = abs(sum - target)
                    if diff < minDiff {
                        minDiff = diff
                        closest = sum
                    }
                    if s < k {
                        low += 1
                    } else if s > k {
                        high -= 1
                    }
                } else {
                    return target
                }
            }
        }
        
        return closest
    }
    
    public static func test() -> Bool {
        let array = [-1,2,1,-4]
        let test = ThreeSumClosestTestCase(array: array, target: 1)
        test.run()
        return test.result == 2
    }
}
