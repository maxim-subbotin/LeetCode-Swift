//
//  TwoSumTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/28/20.
//

import Foundation

public class TwoSumTestCase: TestCase {
    public var name: String = "Two Sum"
    var array: [Int]
    var target: Int
    var result = [Int]()
    
    init(withArray arr: [Int], andTarget t: Int) {
        self.array = arr
        self.target = t
    }
    
    public func run() {
        result = twoSum(array, target)
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int:Int]()
        for i in 0..<nums.count {
            map[nums[i]] = i
        }
        for i in 0..<nums.count {
            if map[(target - nums[i])] != nil {
                let index = map[(target - nums[i])]!
                if index != i {
                    return [i, index]
                }
            }
        }
        
        return []
    }
    
    public static func test() -> Bool {
        let testData = [2,7,11,15]
        let t = 9
        let test = TwoSumTestCase(withArray: testData, andTarget: t)
        test.run()
        return test.result == [0,1]
    }
}
