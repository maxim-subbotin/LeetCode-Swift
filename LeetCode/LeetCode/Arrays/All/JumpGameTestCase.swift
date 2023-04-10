//
//  JumpGameTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 30.03.2023.
//

import Foundation

public class JumpGameTestCase: TestCase {
    public var name: String = "Jump Game"
    let nums: [Int]
    var result = false
    
    init(nums: [Int]) {
        self.nums = nums
    }
    
    public func run() {
        result = canJump(nums)
    }
    
    func canJump(_ nums: [Int]) -> Bool {
        var s = 0
        for i in 0..<nums.count {
            if s < i {
                return false
            }
            s = max(s, i + nums[i])
        }
        return true
    }
    
    public static func test() -> Bool {
        let test = JumpGameTestCase(nums: [2,3,1,1,4])
        test.run()
        return test.result == true
    }
}
