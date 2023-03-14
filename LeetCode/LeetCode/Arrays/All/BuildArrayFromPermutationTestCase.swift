//
//  BuildArrayFromPermutationTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 26.02.2023.
//

import Foundation

public class BuildArrayFromPermutationTestCase: TestCase {
    public var name = "Build Array from Permutation"
    var array: [Int]
    
    init(array: [Int]) {
        self.array = array
    }
    
    public func run() {
        array = buildArray(array)
    }
    
    func buildArray(_ nums: [Int]) -> [Int] {
        return (0..<nums.count).map { nums[nums[$0]] }
    }
    
    public static func test() -> Bool {
        let array = [5,0,1,2,3,4]
        let test = BuildArrayFromPermutationTestCase(array: array)
        test.run()
        return test.array == [4,5,0,1,2,3]
    }
}
