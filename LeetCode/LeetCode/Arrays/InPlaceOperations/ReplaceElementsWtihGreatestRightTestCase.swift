//
//  ReplaceElementsWtihGreatestRightTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/26/20.
//

import Foundation

public class ReplaceElementsWtihGreatestRightTestCase: TestCase {
    public var name: String = "Replace Elements with Greatest Element on Right Side"
    var array: [Int]
    var result = [Int]()
    
    init(withArray arr: [Int]) {
        self.array = arr
    }
    
    public func run() {
        result = replaceElements(array)
    }
    
    func replaceElements(_ arr: [Int]) -> [Int] {
        if arr.count == 1 {
            return [-1]
        }
        var resultArray = Array(repeating: -1, count: arr.count)
        var maxVal = arr.last!
        for i in (0...arr.count-2).reversed() {
            resultArray[i] = maxVal
            if arr[i] > maxVal {
                maxVal = arr[i]
            }
        }
        return resultArray
    }
    
    public static func test() -> Bool {
        let testData = [17,18,5,4,6,1]
        let test = ReplaceElementsWtihGreatestRightTestCase(withArray: testData)
        test.run()
        return test.result == [18,6,6,6,1,-1]
    }
}
