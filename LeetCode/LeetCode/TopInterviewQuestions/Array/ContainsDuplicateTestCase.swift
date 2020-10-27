//
//  ContainsDuplicateTestCase.swift
//  LeetCode
//
//  Created by Snappii on 10/27/20.
//

import Foundation

public class ContainsDuplicateTestCase: TestCase {
    public var name: String = "Contains Duplicate"
    var array: [Int]
    var result = false
    
    init(withArray arr: [Int]) {
        self.array = arr
    }
    
    public func run() {
        result = containsDuplicate(array)
    }
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var map = [Int:Int]()
        for i in 0..<nums.count {
            if map[nums[i]] == nil {
                map[nums[i]] = 1
            } else {
                return true
            }
        }
        return false
    }
    
    public static func test() -> Bool {
        let testData = [1,2,3,1]
        let test = ContainsDuplicateTestCase(withArray: testData)
        test.run()
        return test.result
    }
}
