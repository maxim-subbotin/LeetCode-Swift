//
//  MoveZeroesTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/26/20.
//

import Foundation

public class MoveZeroesTestCase: TestCase {
    public var name: String = "Move Zeroes"
    var array: [Int]
    
    init(withArray arr: [Int]) {
        array = arr
    }
    
    public func run() {
        moveZeroes(&array)
    }
    
    func moveZeroes(_ nums: inout [Int]) {
        if nums.count < 2 {
            return
        }

        var newArrayIndex = 0
        for index in 0..<nums.count {
            if nums[index] != 0 {
                nums[newArrayIndex] = nums[index]
                newArrayIndex += 1
            }
        }
        for index in newArrayIndex..<nums.count {
            nums[index] = 0
        }
    }
    
    public static func test() -> Bool {
        let testData = [0,0,1,2,0,3,0,5,6,0]
        let test = MoveZeroesTestCase(withArray: testData)
        test.run()
        return test.array == [1,2,3,5,6,0,0,0,0,0]
    }
}
