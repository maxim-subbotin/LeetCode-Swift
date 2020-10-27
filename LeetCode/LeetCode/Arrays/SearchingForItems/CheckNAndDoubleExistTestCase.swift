//
//  CheckNAndDoubleExistTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/26/20.
//

import Foundation

public class CheckNAndDoubleExistTestCase: TestCase {
    public var name: String = "Check If N and Its Double Exist"
    var array: [Int]
    var result = false
    
    init(withArray arr: [Int]) {
        array = arr
    }
    
    public func run() {
        result = checkIfExist(array)
    }
    
    func checkIfExist(_ arr: [Int]) -> Bool {
        var map = [Int:Bool]()
        var countOfZeros = 0
        for i in 0..<arr.count {
            if arr[i] == 0 {
                countOfZeros += 1
            } else {
                if map[arr[i]] ?? false {
                    return true
                }
                if arr[i] % 2 == 0 {
                    map[arr[i] / 2] = true
                }
            }
        }
        
        if countOfZeros > 1 {
            return true
        }
        
        for i in 0..<arr.count {
            if map[arr[i]] ?? false {
                return true
            }
        }
        
        return false
    }
    
    // the most obvious solution
    /*func checkIfExist(_ arr: [Int]) -> Bool {
        let sortedArray = arr.sorted()
        
        if sortedArray[0] == 0 && sortedArray[1] == 0 {
            return true
        }
        
        for n in sortedArray {
            if n == 0 {
                continue
            }
            if sortedArray.contains(2 * n) {
                return true
            }
        }
        return false
    }*/
    
    public static func test() -> Bool {
        let testData = [2, 3, 8, 3, 5, 9, 6, 7, 0, 9]
        let test = CheckNAndDoubleExistTestCase(withArray: testData)
        test.run()
        return test.result
    }
}
