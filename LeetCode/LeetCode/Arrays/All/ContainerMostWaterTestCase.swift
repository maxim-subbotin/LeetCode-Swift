//
//  ContainerMostWaterTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 27.02.2023.
//

import Foundation

public class ContainerMostWaterTestCase: TestCase {
    public var name = "Container With Most Water"
    var array: [Int]
    var result = -1
    
    init(array: [Int]) {
        self.array = array
    }
    
    public func run() {
        result = maxArea(array)
    }
    
    func maxArea(_ height: [Int]) -> Int {
        var from = 0
        var to = height.count - 1
        var maxArea = 0
        while from < to {
            maxArea = max(maxArea, volume(array: height, from: from, to: to))
            if height[from] < height[to] {
                from += 1
            } else {
                to -= 1
            }
        }
        return maxArea
    }
    
    func volume(array: [Int], from: Int, to: Int) -> Int {
        abs(from - to) * min(array[from], array[to])
    }
    
    static public func test() -> Bool {
        let array = [1,8,6,2,5,4,8,3,7]
        let test = ContainerMostWaterTestCase(array: array)
        test.run()
        return test.result == 49
    }
}
