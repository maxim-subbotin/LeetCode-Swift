//
//  MaxPointsOnLineTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 18.03.2023.
//

import Foundation

public class MaxPointsOnLineTestCase: TestCase {
    public var name: String = "Max Points on a Line"
    var points: [[Int]]
    var result = 0
    
    init(points: [[Int]]) {
        self.points = points
    }
    
    public func run() {
        result = maxPoints(points)
    }
    
    func maxPoints(_ points: [[Int]]) -> Int {
        var maxP = 0
        for point1 in points {
            var map = [Double: Int]()
            for point2 in points {
                if point1 == point2 {
                    continue
                }
                var s = 0.0
                if point2[0] - point1[0] == 0 {
                    s = -10000
                } else {
                    s = Double(point2[1] - point1[1]) / Double(point2[0] - point1[0])
                }
                map[s] = (map[s] ?? 0) + 1
                maxP = max(maxP, map[s] ?? 0)
            }
        }
        return maxP + 1
    }
    
    public static func test() -> Bool {
        let test = MaxPointsOnLineTestCase(points: [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]])
        test.run()
        return test.result == 4
    }
}
