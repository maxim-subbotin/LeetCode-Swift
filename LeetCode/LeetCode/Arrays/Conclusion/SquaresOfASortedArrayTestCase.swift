//
//  SquaresOfASortedArray.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 26.02.2023.
//

import Foundation

public class SquaresOfASortedArrayTestCase: TestCase {
    public var name: String = "Squares of a Sorted Array"
    var array: [Int]
    
    init(withArray arr: [Int]) {
        self.array = arr
    }
    
    
    public func run() {
        array = sortedSquares(array)
    }
    
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var posSquares = [Int]()
        var negSquares = [Int]()
        for i in 0..<nums.count {
            if nums[i] < 0 {
                negSquares.append(nums[i] * nums[i])
            } else {
                posSquares.append(nums[i] * nums[i])
            }
        }
        if negSquares.count == 0 {
            return posSquares
        }
        return merge(arr1: posSquares, arr2: negSquares)
    }
    
    func merge(arr1: [Int], arr2: [Int]) -> [Int] {
        var i = 0
        var j = arr2.count - 1
        var k = 0
        var res = Array(repeating: 0, count: arr1.count + arr2.count)
        while i < arr1.count && j >= 0 {
            if arr1[i] < arr2[j] {
                res[k] = arr1[i]
                k += 1
                i += 1
            } else {
                res[k] = arr2[j]
                k += 1
                j -= 1
            }
        }
        while i < arr1.count {
            res[k] = arr1[i]
            k += 1
            i += 1
        }
        while j >= 0 {
            res[k] = arr2[j]
            k += 1
            j -= 1
        }
        return res
    }
    
    public static func test() -> Bool {
        let array = [-10, -9, -7, -3, 0, 2, 3, 4, 11]
        let test = SquaresOfASortedArrayTestCase(withArray: array)
        test.run()
        return test.array == [4, 9, 9, 49, 121]
    }
}
