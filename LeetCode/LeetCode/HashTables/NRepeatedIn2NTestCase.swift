//
//  NRepeatedIn2NTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 13.04.2023.
//

import Foundation

public class NRepeatedIn2NTestCase: TestCase {
    public var name: String = "N-Repeated Element in Size 2N Array"
    let nums: [Int]
    var result = 0
    
    init(nums: [Int]) {
        self.nums = nums
    }
    
    public func run() {
        result = repeatedNTimes(nums)
    }
    
    func repeatedNTimes(_ nums: [Int]) -> Int {
        let n = nums.count / 2
        var stat = [Int: Int]()
        for i in 0..<nums.count {
            let v = (stat[nums[i]] ?? 0) + 1
            if v == n {
                return nums[i]
            } else {
                stat[nums[i]] = v
            }
        }
        return 0
    }
    
    public static func test() -> Bool {
        let test = NRepeatedIn2NTestCase(nums: [5,1,5,2,5,3,5,4])
        test.run()
        return test.result == 5
    }
}
