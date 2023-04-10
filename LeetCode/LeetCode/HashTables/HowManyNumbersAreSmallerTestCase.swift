//
//  HowManyNumbersAreSmallerTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 09.04.2023.
//

import Foundation

public class HowManyNumbersAreSmallerTestCase: TestCase {
    public var name: String = "How Many Numbers Are Smaller Than the Current Number"
    let array: [Int]
    var result = [Int]()
    
    init(array: [Int]) {
        self.array = array
    }
    
    public func run() {
        result = smallerNumbersThanCurrent(array)
    }
    
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var dict = [Int: Int]()
        let dist = Set(nums)
        for i in 0..<nums.count {
            if dict[nums[i]] == nil {
                dict[nums[i]] = 1
            } else {
                dict[nums[i]]! += 1
            }
        }
        var sums = [Int: Int]()
        for n in dist {
            sums[n] = dist.filter({ k in k < n }).reduce(0, { $0 + dict[$1]! })
        }
        return nums.map { sums[$0]! }
    }
    
    public static func test() -> Bool {
        let test = HowManyNumbersAreSmallerTestCase(array: [8,1,2,2,3])
        test.run()
        return test.result == [4,0,1,1,3]
    }
}
