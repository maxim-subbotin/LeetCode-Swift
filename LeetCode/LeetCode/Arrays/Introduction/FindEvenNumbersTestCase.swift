//
//  FindEvenNumbersTestCase.swift
//  LeetCode
//
//  Created by Snappii on 10/23/20.
//

import Foundation

public class FindEvenNumbersTestCase: TestCase {
    public var name: String = "Find Numbers with Even Number of Digits"
    var array: [Int]
    var result = 0
    
    public init(withArray arr: [Int]) {
        array = arr
    }
    
    public func run() {
        result = findNumbers(array)
    }
    
    func findNumbers(_ nums: [Int]) -> Int {
        var num = 0
        for i in (0..<nums.count) {
            let digitCount = Int(floor(log10(Double(nums[i])))) + 1
            if digitCount % 2 == 0 {
                num += 1
            }
        }
        return num
    }
    
    public static func test() -> Bool {
        let testData = [12,345,2,6,7896,1,23,54634,99999] //[12,345,2,6,7896]
        let test = FindEvenNumbersTestCase(withArray: testData)
        test.run()
        return test.result == 3
    }
}
