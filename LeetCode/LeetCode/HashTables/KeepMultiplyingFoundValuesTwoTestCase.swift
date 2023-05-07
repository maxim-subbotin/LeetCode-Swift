//
//  KeepMultiplyingFoundValuesTwoTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 07.05.2023.
//

import Foundation

public class KeepMultiplyingFoundValuesTwoTestCase: TestCase {
    public var name: String = "Keep Multiplying Found Values by Two"
    let array: [Int]
    let origin: Int
    var result = 0
    
    init(array: [Int], origin: Int) {
        self.array = array
        self.origin = origin
    }
    
    public func run() {
        result = findFinalValue(array, origin)
    }
    
    func findFinalValue(_ nums: [Int], _ original: Int) -> Int {
        let set = Set(nums)
        var x = original
        while set.contains(x) {
            x *= 2
        }
        return x
    }
    
    public static func test() -> Bool {
        let test = KeepMultiplyingFoundValuesTwoTestCase(array: [5,3,6,1,12], origin: 3)
        test.run()
        return test.result == 24
    }
}
