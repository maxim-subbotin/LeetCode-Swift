//
//  PermutationsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 29.03.2023.
//

import Foundation

public class PermutationsTestCase: TestCase {
    public var name: String = "Permutations"
    let nums: [Int]
    var result = [[Int]]()
    
    init(nums: [Int]) {
        self.nums = nums
    }
    
    public func run() {
        result = permute(nums)
    }
    
    func permute(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        var indexes = Array(repeating: false, count: nums.count)
        var nums = nums
        combine(results: &results, array: nums, pos: 0, stack: [], indexes: indexes)
        return results
    }
    
    func combine(results: inout [[Int]], array: [Int], pos: Int, stack: [Int], indexes: [Bool]) {
        if stack.count == array.count {
            results.append(stack)
        } else {
            for i in 0..<indexes.count {
                if !indexes[i] {
                    var s = stack
                    s.append(array[i])
                    var ids = indexes
                    ids[i] = true
                    combine(results: &results, array: array, pos: pos + 1, stack: s, indexes: ids)
                }
            }
        }
    }
    
    public static func test() -> Bool {
        let test = PermutationsTestCase(nums: [1,2,3])
        test.run()
        return test.result == [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
    }
}
