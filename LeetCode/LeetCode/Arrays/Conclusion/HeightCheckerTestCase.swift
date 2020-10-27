//
//  HeightCheckerTestCase.swift
//  LeetCode
//
//  Created by Snappii on 10/27/20.
//

import Foundation

public class HeightCheckerTestCase: TestCase {
    public var name: String = "Height Checker"
    var array: [Int]
    var result = 0
    
    init(withArray arr: [Int]) {
        self.array = arr
    }
    
    public func run() {
        result = heightChecker(array)
    }
    
    // the simplest solution
    func heightChecker(_ heights: [Int]) -> Int {
        let sortedArray = heights.sorted()
        var s = 0
        for i in 0..<sortedArray.count {
            if sortedArray[i] != heights[i] {
                s += 1
            }
        }
        return s
    }
    
    public static func test() -> Bool {
        let testData = [1,1,4,2,1,3]
        let test = HeightCheckerTestCase(withArray: testData)
        test.run()
        return test.result == 3
    }
    
}
