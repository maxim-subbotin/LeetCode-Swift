//
//  MaxConsecutiveOnesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 10/23/20.
//

import Foundation

public class MaxConsecutiveOnesTestCase: TestCase {
    public var name: String = "Max Consecutive Ones"
    var array: [Int]
    var result = 0
    
    public init(withArray arr: [Int]) {
        array = arr
    }
    
    public func run() {
        var maxLength = 0
        var sectionLength = 0
        for i in (0..<array.count) {
            if array[i] == 1 {
                sectionLength += 1
            } else {
                maxLength = max(sectionLength, maxLength)
                sectionLength = 0
            }
        }
        maxLength = max(sectionLength, maxLength)
        result = maxLength
    }
    
    public static func test() -> Bool {
        let testData = [1,1,0,1,1,1]
        let test = MaxConsecutiveOnesTestCase(withArray: testData)
        test.run()
        return test.result == 3
    }
}
