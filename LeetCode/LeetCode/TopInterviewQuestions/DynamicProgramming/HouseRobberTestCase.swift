//
//  HouseRobberTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 26.02.2023.
//

import Foundation

public class HouseRobberTestCase: TestCase {
    public var name: String = "House Robber"
    let nums: [Int]
    var result: Int = -1
    
    init(withNums ns: [Int]) {
        self.nums = ns
    }
    
    public func run() {
        result = rob(nums)
    }
    
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        var results = [Int]()
        for i in 0..<nums.count {
            let prevMax = get(at: i - 1, in: results)
            let prevMax2 = get(at: i - 2, in: results)
            results.append(max(nums[i] + prevMax2, prevMax))
        }
        
        return results.last ?? 0
    }
    
    func get(at: Int, in array: [Int]) -> Int {
        if at >= 0 && at < array.count {
            return array[at]
        } else {
            return 0
        }
    }
    
    public static func test() -> Bool {
        let array = [1,2,3,1,5,7,2,8]
        let test = HouseRobberTestCase(withNums: array)
        test.run()
        return test.result == 19
    }
}
