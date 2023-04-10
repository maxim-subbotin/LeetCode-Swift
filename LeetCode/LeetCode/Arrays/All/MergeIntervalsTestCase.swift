//
//  MergeIntervalsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 30.03.2023.
//

import Foundation

public class MergeIntervalsTestCase: TestCase {
    public var name: String = "Merge Intervals"
    let intervals: [[Int]]
    var result = [[Int]]()
    
    init(intervals: [[Int]]) {
        self.intervals = intervals
    }
    
    public func run() {
        result = merge(intervals)
    }
    
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.count <= 1 {
            return intervals
        }
        let sorted = intervals.sorted(by: { $0[0] < $1[0] })
        var res = [sorted[0]]
        for i in 1..<sorted.count {
            if let merged = mergeIntervals(res[res.count - 1], sorted[i]) {
                res[res.count - 1] = merged
            } else {
                res.append(sorted[i])
            }
        }
        return res
    }
    
    func mergeIntervals(_ a: [Int], _ b: [Int]) -> [Int]? {
        if a[1] >= b[0] && a[0] <= b[0] {
            return [a[0], max(a[1], b[1])]
        } else if b[1] > a[0] && b[0] <= a[0] {
            return [b[0], max(a[1], b[1])]
        } else {
            return nil
        }
    }
    
    public static func test() -> Bool {
        let test = MergeIntervalsTestCase(intervals: [[2,10],[5,8],[3,12],[22,30]])
        test.run()
        return test.result == [[2,12],[22,30]]
    }
}
