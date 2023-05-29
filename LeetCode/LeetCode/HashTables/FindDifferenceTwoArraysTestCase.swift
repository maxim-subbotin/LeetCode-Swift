//
//  FindDifferenceTwoArraysTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 08.05.2023.
//

import Foundation

public class FindDifferenceTwoArraysTestCase: TestCase {
    public var name: String = "Find the Difference of Two Arrays"
    let array1: [Int]
    let array2: [Int]
    var result = [[Int]]()
    
    init(array1: [Int], array2: [Int]) {
        self.array1 = array1
        self.array2 = array2
    }
    
    public func run() {
        result = findDifference(array1, array2)
    }
    
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        let s1 = Set(nums1)
        let s2 = Set(nums2)
        let r1 = s1.subtracting(s2)
        let r2 = s2.subtracting(s1)
        return [Array(r1), Array(r2)]
    }
    
    public static func test() -> Bool {
        let test = FindDifferenceTwoArraysTestCase(array1: [1,2,3], array2: [2,4,6])
        test.run()
        return test.result == [[1,3],[4,6]]
    }
}
