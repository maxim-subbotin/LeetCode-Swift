//
//  IntersectionTwoArraysTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 25.05.2023.
//

import Foundation

public class IntersectionTwoArraysTestCase: TestCase {
    public var name: String = "Intersection of Two Arrays"
    let arr1: [Int]
    let arr2: [Int]
    var result = [Int]()
    
    init(arr1: [Int], arr2: [Int]) {
        self.arr1 = arr1
        self.arr2 = arr2
    }
    
    public func run() {
        result = intersection(arr1, arr2)
    }
    
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stat = [Int: Int]()
        for n in nums1 {
            if stat[n] == nil {
                stat[n] = 1
            }
        }
        var intersection = [Int]()
        for n in nums2 {
            if stat[n] == 1 {
                intersection.append(n)
                stat[n] = 2
            }
        }
        return intersection
    }
    
    public static func test() -> Bool {
        let test = IntersectionTwoArraysTestCase(arr1: [4,9,5], arr2: [9,4,9,8,4])
        test.run()
        return Set(test.result) == Set([4,9])
    }
}
