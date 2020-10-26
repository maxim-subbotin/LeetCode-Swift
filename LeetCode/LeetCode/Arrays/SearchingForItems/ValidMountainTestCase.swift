//
//  ValidMountainTestCase.swift
//  LeetCode
//
//  Created by Snappii on 10/26/20.
//

import Foundation

public class ValidMountainTestCase: TestCase {
    public var name: String = "Valid Mountain Array"
    var array: [Int]
    var result = false
    
    init(withArray arr: [Int]) {
        self.array = arr
    }
    
    public func run() {
        result = validMountainArray(array)
    }
    
    func validMountainArray(_ A: [Int]) -> Bool {
        if A.count < 3 {
            return false
        }
        var dx = A[1] - A[0]
        if dx <= 0 {
            return false
        }
        var wasPeak = false
        for i in 2..<A.count {
            let delta = A[i] - A[i - 1]
            if delta == 0 {
                return false
            }
            if dx > 0 && delta < 0 {    // it's a peak
                wasPeak = true
                dx = delta
            } else if dx < 0 && delta > 0 {
                return false
            }
        }
        return wasPeak
    }
    
    public static func test() -> Bool {
        let testData = [0,3,2,1]
        let test = ValidMountainTestCase(withArray: testData)
        test.run()
        return test.result
    }
}
