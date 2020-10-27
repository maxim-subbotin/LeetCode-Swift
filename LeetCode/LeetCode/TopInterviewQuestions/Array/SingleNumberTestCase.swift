//
//  SingleNumberTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/27/20.
//

import Foundation

public class SingleNumberTestCase: TestCase {
    public var name: String = "Single Number"
    var array: [Int]
    var result = 0
    
    init(withArray arr: [Int]) {
        array = arr
    }
    
    public func run() {
        result = singleNumber(array)
    }
    
    func singleNumber(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        var val = nums[0]
        // XOR 'coz a ^ a = 0
        for i in 1..<nums.count {
            val = val ^ nums[i]
        }
        return val
    }
    
    /*
    func singleNumber(_ nums: [Int]) -> Int {
        var map = [Int:Int]()
        for n in nums {
            if map[n] == nil {
                map[n] = 1
            } else {
                map[n]! += 1
            }
        }
        for k in map.keys {
            if map[k] == 1 {
                return k
            }
        }
        return 0
    }
     */
    
    /*
    func singleNumber(_ nums: [Int]) -> Int {
        var distinct = Set<Int>()
        var pairs = Set<Int>()
        for n in nums {
            if distinct.contains(n) {
                pairs.insert(n)
            } else {
                distinct.insert(n)
            }
        }
        let res = distinct.subtracting(pairs)
        return res.first ?? 0
    }
     */
    
    public static func test() -> Bool {
        let testData = [4,1,2,1,2]
        let test = SingleNumberTestCase(withArray: testData)
        test.run()
        return test.result == 4
    }
}
