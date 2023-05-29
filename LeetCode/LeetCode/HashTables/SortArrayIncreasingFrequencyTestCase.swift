//
//  SortArrayIncreasingFrequencyTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 26.05.2023.
//

import Foundation

public class SortArrayIncreasingFrequencyTestCase: TestCase {
    public var name: String = "Sort Array by Increasing Frequency"
    let array: [Int]
    var result = [Int]()
    
    init(array: [Int]) {
        self.array = array
    }
    
    public func run() {
        result = frequencySort(array)
    }
    
    func frequencySort(_ nums: [Int]) -> [Int] {
        var stat = [Int: Int]()
        for i in 0..<nums.count {
            stat[nums[i], default: 0] += 1
        }
        let sorted = stat.sorted(by: { $0.value == $1.value ? $0.key > $1.key : $0.value < $1.value })
        return sorted.flatMap({ Array(repeating: $0.key, count: $0.value) })
    }
    
    public static func test() -> Bool {
        let test = SortArrayIncreasingFrequencyTestCase(array: [1,1,2,2,2,3])
        test.run()
        return test.result == [3,1,1,2,2,2]
    }
}
