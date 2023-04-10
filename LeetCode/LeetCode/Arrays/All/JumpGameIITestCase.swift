//
//  JumpGame II.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 29.03.2023.
//

import Foundation

public class JumpGameIITestCase: TestCase {
    public var name: String = "Jump Game II"
    let nums: [Int]
    var result = 0
    
    init(nums: [Int]) {
        self.nums = nums
    }
    
    public func run() {
        result = jump(nums)
    }
    
    func jump(_ nums: [Int]) -> Int {
        var js = Array(repeating: 0, count: nums.count)
        for i in 1..<nums.count {
            for j in 0..<i {
                if j + nums[j] >= i {
                    js[i] = 1 + js[j]
                    break
                }
            }
        }
        return js[js.count - 1]
    }
    
    public static func test() -> Bool {
        let test = JumpGameIITestCase(nums: [2,3,1,1,4])
        test.run()
        return test.result == 2
    }
}
