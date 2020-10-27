//
//  FindDisappearedNumbersTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/27/20.
//

import Foundation

public class FindDisappearedNumbersTestCase: TestCase {
    public var name: String = "Find All Numbers Disappeared in an Array"
    var array: [Int]
    var result = [Int]()
    
    init(withArray arr: [Int]) {
        self.array = arr
    }
    
    public func run() {
        result = findDisappearedNumbers(array)
    }
    
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var arr = nums
        var missedNumbers = [Int]()
        for i in 0..<arr.count {
            let val = arr[i]
            let index = abs(val) - 1
            if arr[index] > 0 { // not marked yet
                arr[index] *= -1
            }
        }
        for i in 0..<arr.count {
            if arr[i] > 0 {
                missedNumbers.append(i + 1)
            }
        }
        
        return missedNumbers
    }
    
    func swap(from i: Int, to j: Int, in array: inout [Int]) {
        let a = array[j]
        array[j] = array[i]
        array[i] = a
    }
    
    public static func test() -> Bool {
        let testData = [4,3,2,7,8,2,3,1]
        let test = FindDisappearedNumbersTestCase(withArray: testData)
        test.run()
        return test.result == [5,6]
    }
}
