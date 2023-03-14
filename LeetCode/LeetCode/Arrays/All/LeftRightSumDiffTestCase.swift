//
//  LeftRightSumDiffTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 01.03.2023.
//

import Foundation

public class LeftRightSumDiffTestCase: TestCase {
    public var name = "Container With Most Water"
    var array: [Int]
    var result = [Int]()
    
    init(array: [Int]) {
        self.array = array
    }
    
    public func run() {
        result = leftRigthDifference(array)
    }
    
    func leftRigthDifference(_ nums: [Int]) -> [Int] {
        var left = 0
        var right = (1..<nums.count).reduce(0, { $0 + nums[$1] })
        var result = [Int]()
        for i in 0..<nums.count {
            result.append(abs(left - right))
            left += nums[i]
            right -= (i + 1 < nums.count) ? nums[i + 1] : 0
        }
        return result
    }
    
    public static func test() -> Bool {
        let array = [10,4,8,3]
        let test = LeftRightSumDiffTestCase(array: array)
        test.run()
        return test.result == [15,1,11,22]
    }
}
