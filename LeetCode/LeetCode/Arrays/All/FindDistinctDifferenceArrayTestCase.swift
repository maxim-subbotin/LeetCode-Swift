//
//  FindDistinctDifferenceArrayTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 21.05.2023.
//

import Foundation

public class FindDistinctDifferenceArrayTestCase: TestCase {
    public var name: String = "Find the Distinct Difference Array"
    let array: [Int]
    var result = [Int]()
    
    init(array: [Int]) {
        self.array = array
    }
    
    public func run() {
        result = distinctDifferenceArray(array)
    }
    
    func distinctDifferenceArray(_ nums: [Int]) -> [Int] {
        var a1 = [Int]()
        var a2 = [Int]()
        var set = Set<Int>()
        for i in 0..<nums.count {
            set.insert(nums[i])
            a1.append(set.count)
        }
        set.removeAll()
        for i in (0..<nums.count).reversed() {
            set.insert(nums[i])
            a2.append(set.count)
        }
        var res = [Int]()
        for i in 0..<nums.count {
            let b = (a2.count - 2 - i) < 0 ? 0 : a2[a2.count - 2 - i]
            res.append(a1[i] - b)
        }
        return res
    }
    
    public static func test() -> Bool {
        let test = FindDistinctDifferenceArrayTestCase(array: [3,2,3,4,2])
        test.run()
        return test.result == [-2,-1,0,2,3]
    }
}
