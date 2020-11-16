//
//  MissingNumberTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 16.11.2020.
//

import Foundation

public class MissingNumberTestCase: TestCase {
    public var name: String = "Missing Number"
    let nums: [Int]
    var result = -1
    
    init(withNums nums: [Int]) {
        self.nums = nums
    }
    
    public func run() {
        result = missingNumber(nums)
    }
    
    func missingNumber(_ nums: [Int]) -> Int {
        var sum = nums.count * (1 + nums.count) / 2
        for n in nums {
            sum -= n
        }
        return sum
    }
    
    public static func test() -> Bool {
        let test = MissingNumberTestCase(withNums: [9,6,4,2,3,5,7,0,1])
        test.run()
        return test.result == 8
    }
}
