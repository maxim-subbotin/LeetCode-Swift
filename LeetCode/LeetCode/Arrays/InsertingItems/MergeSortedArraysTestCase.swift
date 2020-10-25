//
//  MergeSortedArraysTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 25.10.2020.
//

import Foundation

public class MergeSortedArraysTestCase: TestCase {
    public var name: String = "Merge Sorted Array"
    var array1: [Int]
    var array2: [Int]
    var n: Int
    var m: Int
    
    init(withArray arr1: [Int], andArray arr2: [Int]) {
        self.array1 = arr1
        self.array2 = arr2
        self.m = array1.count
        self.n = array2.count
    }
    
    public func run() {
        merge(&array1, m, array2, n)
    }
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var index = 0
        for i in (0..<n) {
            let val = nums2[i]
            if val < nums1[index] {
                while index > 1 && val < nums1[index] {
                    index -= 1
                }
                nums1.insert(val, at: index)
            } else {
                while index < m + i && val > nums1[index] {
                    index += 1
                }
                nums1.insert(val, at: index)
            }
        }
        nums1.removeLast(n)
    }
    
    public static func test() -> Bool {
        let arr1 = [1,2,3,0,0,0]
        let m = 3
        let arr2 = [2,5,6]
        let n = 3
        let test = MergeSortedArraysTestCase(withArray: arr1, andArray: arr2)
        test.n = n
        test.m = m
        test.run()
        
        if test.array1.count != m + n {
            return false
        }
        for i in (0..<(m + n - 1)) {
            let a = test.array1[i]
            let b = test.array1[i + 1]
            if a > b {
                return false
            }
        }
        
        return true
    }
}
