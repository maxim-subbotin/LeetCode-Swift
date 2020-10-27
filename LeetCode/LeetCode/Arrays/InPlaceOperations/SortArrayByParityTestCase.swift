//
//  SortArrayByParityTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/26/20.
//

import Foundation

public class SortArrayByParityTestCase: TestCase {
    public var name: String = "Sort Array By Parity"
    var array: [Int]
    var result = [Int]()
    
    init(withArray arr: [Int]) {
        self.array = arr
    }
    
    public func run() {
        result = sortArrayByParity(array)
    }
    
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var array = A
        var evenIndex = 0
        var oddIndex = A.count - 1
        for i in 0..<A.count {
            if A[i] % 2 == 0 {
                array[evenIndex] = A[i]
                evenIndex += 1
            } else {
                array[oddIndex] = A[i]
                oddIndex -= 1
            }
        }
        return array
    }
    
    /*
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var array = [Int]()
        for n in A {
            if n % 2 == 0 {
                array.insert(n, at: 0)
            } else {
                array.append(n)
            }
        }
        return array
    }
    */
    
    public static func test() -> Bool {
        let testData = [1,2,3,4,5,6,7,8]
        let test = SortArrayByParityTestCase(withArray: testData)
        test.run()
        return test.result == [2,4,6,8,7,5,3,1]
    }
}
