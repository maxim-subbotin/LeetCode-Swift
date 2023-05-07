//
//  MergeTwoArraysSummingValuesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 01.05.2023.
//

import Foundation

public class MergeTwoArraysSummingValuesTestCase: TestCase {
    public var name: String = "Merge Two 2D Arrays by Summing Values"
    let arr1: [[Int]]
    let arr2: [[Int]]
    var result = [[Int]]()
    
    init(arr1: [[Int]], arr2: [[Int]]) {
        self.arr1 = arr1
        self.arr2 = arr2
    }
    
    public func run() {
        result = mergeArrays(arr1, arr2)
    }
    
    func mergeArrays(_ nums1: [[Int]], _ nums2: [[Int]]) -> [[Int]] {
        var dict = [Int: Int]()
        var keys = [Int]()
        for p in nums1 {
            dict[p[0]] = p[1]
            keys.append(p[0])
        }
        var i = 0
        for p in nums2 {
            dict[p[0], default: 0] += p[1]
            while keys[i] < p[0] {
                i += 1
                if i == keys.count {
                    break
                }
            }
            if i >= keys.count {
                keys.append(p[0])
            } else if p[0] != keys[i] {
                keys.insert(p[0], at: i)
            }
        }
        return keys.map { [ $0, dict[$0]! ] }
    }
    
    public static func test() -> Bool {
        let test = MergeTwoArraysSummingValuesTestCase(arr1: [[1,2]], arr2: [[2,4]])
        test.run()
        return test.result == [[1,2],[2,4]]
    }
}
