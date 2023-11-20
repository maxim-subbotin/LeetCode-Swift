//
//  CheckIsStraightLineTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 31.10.2023.
//

import Foundation

public class CheckIsStraightLineTestCase: TestCase {
    public var name: String = "Check If It Is a Straight Line"
    var coordinates: [[Int]]
    var result = false
    
    init(coordinates: [[Int]]) {
        self.coordinates = coordinates
    }
    
    public func run() {
        result = checkStraightLine(coordinates)
    }
    
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        if coordinates.count <= 2 { return true}
        let k = getK(a: coordinates[0], b: coordinates[1])
        
        for i in 1..<(coordinates.count - 1) {
            let k1 = getK(a: coordinates[i], b: coordinates[i + 1])
            if k1 != k { return false }
        }
        return true
    }
    
    private func getK(a: [Int], b: [Int]) -> Double {
        if a[0] == b[0] { return Double.greatestFiniteMagnitude }
        var p1 = a
        var p2 = b
        if p2[0] < p1[0] {
            p1 = b
            p2 = a
        }
        let dx = p2[0] - p1[0]
        let dy = p2[1] - p1[1]
        return Double(dy) / Double(dx)
    }
    
    public static func test() -> Bool {
        let cases = [
            ([[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]], true),
            ([[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]], false),
            ([[1,1],[2,2],[3,3],[1,5]], false),
            ([[0,0],[0,1],[0,-1]], true)
        ]
        var result = true
        for c in cases {
            let test = CheckIsStraightLineTestCase(coordinates: c.0)
            test.run()
            let res = test.result == c.1
            print(res ? "Correct answer" : "Incorrect answer")
            if !res { result = false }
        }
        return result
    }
}

