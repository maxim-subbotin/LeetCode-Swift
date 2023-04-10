//
//  InsertIntervalTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 31.03.2023.
//

import Foundation

public class InsertIntervalTestCase: TestCase {
    public var name: String = "Insert Interval"
    let intervals: [[Int]]
    let interval: [Int]
    var result = [[Int]]()
    
    init(intervals: [[Int]], with interval: [Int]) {
        self.intervals = intervals
        self.interval = interval
    }
    
    public func run() {
        result = insert(intervals, interval)
    }
    
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        if intervals.count == 0 {
            return [newInterval]
        }
        var mergedIndexes = [Int]()
        var mergedItem: [Int]?
        var position: Int?
        if newInterval[1] < intervals[0][0] {
            position = 0
        }
        for i in 0..<intervals.count {
            if let mi = mergedItem, let m = mergeIntervals(mi, intervals[i]) {
                mergedItem = m
                mergedIndexes.append(i)
            } else if let m = mergeIntervals(newInterval, intervals[i]) {
                mergedItem = m
                mergedIndexes.append(i)
            } else {
                if mergedItem != nil {
                    break
                }
            }
            if newInterval[0] > intervals[i][1] {
                position = i + 1
            }
        }
        var res = intervals
        if let mergedItem = mergedItem, let first = mergedIndexes.first, let last = mergedIndexes.last {
            res.removeSubrange(first...last)
            res.insert(mergedItem, at: first)
        } else if mergedItem == nil, let p = position {
            res.insert(newInterval, at: p)
        }
        return res
    }
    
    func mergeIntervals(_ a: [Int], _ b: [Int]) -> [Int]? {
        if a[1] >= b[0] && a[0] <= b[0] {
            return [a[0], max(a[1], b[1])]
        } else if b[1] >= a[0] && b[0] <= a[0] {
            return [b[0], max(a[1], b[1])]
        } else {
            return nil
        }
    }
    
    public static func test() -> Bool {
        let test = InsertIntervalTestCase(intervals: [[1,5]], with: [6,8])
        test.run()
        return test.result == [[1,5],[6,8]]
    }
}
