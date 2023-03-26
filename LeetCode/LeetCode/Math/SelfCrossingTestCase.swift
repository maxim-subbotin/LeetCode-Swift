//
//  SelfCrossingTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 26.03.2023.
//

import Foundation

public class SelfCrossingTestCase: TestCase {
    public var name: String = "Self Crossing"
    var distance: [Int]
    var result = false
    
    init(distance: [Int]) {
        self.distance = distance
    }
    
    public func run() {
        result = isSelfCrossing(distance)
    }
    
    func isSelfCrossing(_ distance: [Int]) -> Bool {
        if distance.count <= 3 { return false }
        for i in 3..<distance.count {
            if distance[i] >= distance[i - 2] && distance[i - 1] <= distance[i - 3] {
                return true
            }
            if i >= 4 {
                if distance[i - 1] == distance[i - 3] &&
                    distance[i] + distance[i - 4] >= distance[i - 2] {
                    return true
                }
            }
            if i >= 5 {
                if distance[i - 2] - distance[i - 4] >= 0 &&
                    distance[i] >= distance[i - 2] - distance[i - 4] &&
                    distance[i - 1] >= distance[i - 3] - distance[i - 5] &&
                    distance[i - 1] <= distance[i - 3] {
                    return true
                }
            }
        }
        return false
    }
    
    public static func test() -> Bool {
        let test = SelfCrossingTestCase(distance: [1,1,1,2,1])
        test.run()
        return test.result == true
    }
}
