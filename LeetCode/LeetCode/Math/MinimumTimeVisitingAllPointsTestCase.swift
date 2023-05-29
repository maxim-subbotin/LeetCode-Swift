//
//  MinimumTimeVisitingAllPointsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 20.05.2023.
//

import Foundation

public class MinimumTimeVisitingAllPointsTestCase: TestCase {
    public var name: String = "Minimum Time Visiting All Points"
    let points: [[Int]]
    var result = 0
    
    init(points: [[Int]]) {
        self.points = points
    }
    
    public func run() {
        result = minTimeToVisitAllPoints(points)
    }
    
    func minTimeToVisitAllPoints(_ points: [[Int]]) -> Int {
        var sum = 0
        var point = points[0]
        var index = 1
        while index < points.count {
            let p = points[index]
            sum += time(p1: point, p2: p)
            point = p
            index += 1
        }
        return sum
    }
    
    func time(p1: [Int], p2: [Int]) -> Int {
        let w = abs(p1[0] - p2[0])
        let h = abs(p1[1] - p2[1])
        return max(w, h)
    }
    
    public static func test() -> Bool {
        let test = MinimumTimeVisitingAllPointsTestCase(points: [[1,1],[3,4],[-1,0]])
        test.run()
        return test.result == 7
    }
}
