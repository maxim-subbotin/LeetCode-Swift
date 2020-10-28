//
//  IntersectionOfTwoArraysV2TestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/28/20.
//

import Foundation

public class IntersectionOfTwoArraysV2TestCase: TestCase {
    public var name: String = "Intersection of Two Arrays II"
    var array1: [Int]
    var array2: [Int]
    var result = [Int]()
    
    init(withArray arr1:[Int], andArray arr2: [Int]) {
        self.array1 = arr1
        self.array2 = arr2
    }
    
    public func run() {
        result = intersect(array1, array2)
    }
    
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let map1 = getStatistic(forArray: nums1)
        let map2 = getStatistic(forArray: nums2)
        let sourceMap: [Int:Int]?
        let targetMap: [Int:Int]?
        if map1.keys.count > map2.keys.count {
            sourceMap = map1
            targetMap = map2
        } else {
            sourceMap = map2
            targetMap = map1
        }
        
        var intersectedArray = [Int]()
        for n in sourceMap!.keys {
            if targetMap![n] != nil {
                let k = min(sourceMap![n]!, targetMap![n]!)
                intersectedArray.append(contentsOf: Array(repeating: n, count: k))
            }
        }
        
        return intersectedArray
    }
    
    func getStatistic(forArray arr: [Int]) -> [Int:Int] {
        var map = [Int:Int]()
        for n in arr {
            if map[n] == nil {
                map[n] = 1
            } else {
                map[n]! += 1
            }
        }
        return map
    }
    
    public static func test() -> Bool {
        let arr1 = [1,2,2,1] //[4,9,5]
        let arr2 = [2,2] //[9,4,9,8,4]
        let test = IntersectionOfTwoArraysV2TestCase(withArray: arr1, andArray: arr2)
        test.run()
        return test.result == [2,2] //[4,9]
    }
}
