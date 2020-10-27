//
//  RemoveDuplicatedFromSortedArrayTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/26/20.
//

import Foundation

public class RemoveDuplicatesFromSortedArrayTestCase: TestCase {
    public var name: String = "Remove Duplicates from Sorted Array"
    var array: [Int]
    var result = 0
    
    init(withArray arr: [Int]) {
        self.array = arr
    }
    
    public func run() {
        self.result = removeDuplicates(&array)
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 1 {
            return nums.count
        }
        
        var index = 1
        var val = nums[0]
        var length = nums.count
        while index < length {
            if nums[index] != val {
                val = nums[index]
                index += 1
            } else {
                nums.remove(at: index)
                length -= 1
            }
        }
        
        return length
    }
    
    public static func test() -> Bool {
        let testData = [1,1,1,2,2,3,4,5,5,6,6,6,7,7,7]
        let test = RemoveDuplicatesFromSortedArrayTestCase(withArray: testData)
        test.run()
        return test.result == 7 && test.array == [1,2,3,4,5,6,7]
    }
}
