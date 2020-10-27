//
//  RemoveDuplicatesV2TestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/26/20.
//

import Foundation

public class RemoveDuplicatesV2TestCase: TestCase {
    public var name: String = "Remove Duplicates from Sorted Array"
    var array: [Int]
    var result = 0
    
    init(withArray arr: [Int]) {
        self.array = arr
    }
    
    public func run() {
        result = removeDuplicates(&array)
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }
        
        var index = 1
        var newArrayIndex = 1
        var val = nums[0]
        while index < nums.count {
            if nums[index] != val {
                val = nums[index]
                nums[newArrayIndex] = val
                newArrayIndex += 1
            }
            
            index += 1
        }
        return newArrayIndex
    }
    
    public static func test() -> Bool {
        let testData = [1,1,1,2,2,3,4,5,5,6,6,6,7,7,7]
        let test = RemoveDuplicatesV2TestCase(withArray: testData)
        test.run()
        return test.result == 7
    }
}
