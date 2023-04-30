//
//  MinCostClimbingStairsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 30.04.2023.
//

import Foundation

public class MinCostClimbingStairsTestCase: TestCase {
    public var name: String = "Min Cost Climbing Stairs"
    let array: [Int]
    var result = 0
    
    init(array: [Int]) {
        self.array = array
    }
    
    public func run() {
        result = minCostClimbingStairs(array)
    }
    
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var arr = Array(repeating: 0, count: cost.count + 1)
        for i in 2...cost.count {
            arr[i] = min(arr[i - 1] + cost[i - 1], arr[i - 2] + cost[i - 2])
        }
        return arr[cost.count]
    }
    
    public static func test() -> Bool {
        let test = MinCostClimbingStairsTestCase(array: [1,100,1,1,1,100,1,1,100,1])
        test.run()
        return test.result == 6
    }
}
