//
//  MedianOfTwoArraysTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 28.02.2023.
//

import Foundation

public class MedianOfTwoArraysTestCase: TestCase {
    public var name = "Median of Two Sorted Arrays"
    var array1: [Int]
    var array2: [Int]
    var result: Double = -1
    
    init(array1: [Int], array2: [Int]) {
        self.array1 = array1
        self.array2 = array2
    }
    
    public func run() {
        result = findMedianSortedArrays(array1, array2)
    }
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let n = nums1.count
        let m = nums2.count
        if n > m {
            return findMedianSortedArrays(nums2, nums1)
        }
        var start = 0
        var end = n
        let realMid: Int = (n + m + 1) / 2
        while start <= end {
            let mid: Int = (start + end) / 2
            let leftSize1 = mid
            let leftSize2 = realMid - mid
            let left1 = leftSize1 > 0 ? nums1[leftSize1 - 1] : Int.min
            let left2 = leftSize2 > 0 ? nums2[leftSize2 - 1] : Int.min
            let right1 = leftSize1 < n ? nums1[leftSize1] : Int.max
            let right2 = leftSize2 < m ? nums2[leftSize2] : Int.max
            if left1 <= right2 && left2 <= right1 {
                if (m + n) % 2 == 0 {
                    return Double(max(left1, left2) + min(right1, right2)) / 2.0
                }
                return Double(max(left1, left2))
            } else if left1 > right2 {
                end = mid - 1
            } else {
                start = mid + 1
            }
        }
        return 0
    }
    
    public static func test() -> Bool {
        let array1 = [1,2]
        let array2 = [3,4]
        let test = MedianOfTwoArraysTestCase(array1: array1, array2: array2)
        test.run()
        return test.result == 2.5
    }
}
