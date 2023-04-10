//
//  MajorityElementTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 05.04.2023.
//

import Foundation

public class MajorityElementTestCase: TestCase {
    public var name: String = "Majority Element"
    let nums: [Int]
    var result = 0
    
    init(nums: [Int]) {
        self.nums = nums
    }
    
    public func run() {
        result = majorityElement(nums)
    }
    
    func majorityElement(_ nums: [Int]) -> Int {
        let k = nums.count / 2
        var dict = [Int: Int]()
        for n in nums {
            dict[n] = (dict[n] ?? 0) + 1
            if dict[n]! > k {
                return n
            }
        }
        return -1
    }
    
    public static func test() -> Bool {
        let test = MajorityElementTestCase(nums: [2,2,1,1,1,2,2])
        test.run()
        return test.result == 2
    }
}
