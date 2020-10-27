//
//  RotateArrayTestCase.swift
//  LeetCode
//
//  Created by Snappii on 10/27/20.
//

import Foundation

public class RotateArrayTestCase: TestCase {
    public var name: String = "Rotate Array"
    var array: [Int]
    var k: Int
    
    init(withArray arr: [Int], andK n: Int) {
        self.array = arr
        self.k = n
    }
    
    public func run() {
        rotate(&array, k)
    }
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        if nums.count == 1 {
            return
        }
        
        let step = k % nums.count
        
        var index = 0
        for i in (nums.count - step)..<nums.count {
            let v = nums[i]
            nums.remove(at: i)
            nums.insert(v, at: index)
            index += 1
        }
    }
    
    public static func test() -> Bool {
        let testData = [1,2,3,4,5,6,7]
        let test = RotateArrayTestCase(withArray: testData, andK: 3)
        test.run()
        return test.array == [5,6,7,1,2,3,4]
    }
}
