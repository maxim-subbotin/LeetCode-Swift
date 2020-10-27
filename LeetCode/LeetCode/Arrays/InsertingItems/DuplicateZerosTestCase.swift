//
//  DuplicateZerosTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/24/20.
//

import Foundation

public class DuplicateZerosTestCase: TestCase {
    public var name: String = "Duplicate Zeros"
    var array: [Int]
    //var result = 0
    
    public init(withArray arr: [Int]) {
        array = arr
    }
    
    public func run() {
        duplicateZeros(&array)
    }
    
    func duplicateZeros(_ arr: inout [Int]) {
        var index = 0
        let length = arr.count
        while index < length {
            if arr[index] == 0 {
                arr.insert(0, at: index)
                //arr.remove(at: arr.count - 1)
                index += 2
            } else {
                index += 1
            }
        }
        arr.removeLast(arr.count - length)
    }
    
    public static func test() -> Bool {
        // [1,0,2,3,0,4,5,0] -> [1,0,0,2,3,0,0,4]
        let testData = [1, 2, 3] //[1,0,2,3,0,4,5,0]
        let test = DuplicateZerosTestCase(withArray: testData)
        test.run()
        return test.array == [1,0,0,2,3,0,0,4]
    }
}
