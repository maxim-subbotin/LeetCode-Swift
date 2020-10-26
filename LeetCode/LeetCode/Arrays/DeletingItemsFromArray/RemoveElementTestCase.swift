//
//  RemoveElementTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 25.10.2020.
//

import Foundation

public class RemoveElementTestCase: TestCase {
    public var name: String = "Remove Element"
    var array: [Int]
    var val: Int
    var result = 0
    
    init(withArray arr: [Int], andValue v: Int) {
        self.array = arr
        self.val = v
    }
    
    public func run() {
        result = removeElement(&array, val)
    }
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var index = 0
        var length = nums.count
        while index < length {
            if nums[index] == val {
                nums.remove(at: index)
                length -= 1
            } else {
                index += 1
            }
        }
        return length
    }
    
    public static func test() -> Bool {
        let testData = [3,2,2,3,0,3,5,5,3,3,0,5,5]
        let v = 0
        // [3,2,2,3], 3
        // [0,1,2,2,3,0,4,2], 2
        // [3,2,2,3,0,3,5,5,3,3,0,5,5], 3
        let test = RemoveElementTestCase(withArray: testData, andValue: v)
        test.run()
        
        return test.result == 11 && test.array == [3,2,2,3,3,5,5,3,3,5,5]
    }
}
