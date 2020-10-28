//
//  PlusOneTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/28/20.
//

import Foundation

public class PlusOneTestCase: TestCase {
    public var name: String = "Plus One"
    var array: [Int]
    var result = [Int]()
    
    init(withArray arr: [Int]) {
        self.array = arr
    }
    
    public func run() {
        result = plusOne(array)
    }
    
    func plusOne(_ digits: [Int]) -> [Int] {
        var arr = digits
        var nextStep = true
        var index = arr.count - 1
        while nextStep && index >= 0 {
            let n = arr[index]
            if n + 1 < 10 {
                arr[index] = n + 1
                nextStep = false
            } else {
                arr[index] = 0
                index -= 1
            }
        }
        if nextStep {
            arr.insert(1, at: 0)
        }
        return arr
    }
    
    public static func test() -> Bool {
        let testData = [4,3,2,1]
        let test = PlusOneTestCase(withArray: testData)
        test.run()
        return test.result == [4,3,2,2]
    }
}
