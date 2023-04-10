//
//  NumberOfArithmeticTripletsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 09.04.2023.
//

import Foundation

public class NumberOfArithmeticTripletsTestCase: TestCase {
    public var name: String = "Number of Arithmetic Triplets"
    let array: [Int]
    let diff: Int
    var result = 0
    
    init(array: [Int], diff: Int) {
        self.array = array
        self.diff = diff
    }
    
    public func run() {
        result = arithmeticTriplets(array, diff)
    }
    
    func arithmeticTriplets(_ nums: [Int], _ diff: Int) -> Int {
        let numSet = Set(nums)
        var n = 0
        for i in 0..<nums.count {
            if numSet.contains(nums[i] + diff) {
                if numSet.contains(nums[i] + 2 * diff) {
                    n += 1
                }
            }
        }
        return n
    }
    
    public static func test() -> Bool {
        let test = NumberOfArithmeticTripletsTestCase(array: [0,1,4,6,7,10], diff: 3)
        test.run()
        return test.result == 2
    }
 }
