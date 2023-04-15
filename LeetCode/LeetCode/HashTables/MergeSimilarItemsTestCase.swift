//
//  MergeSimilarItemsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 13.04.2023.
//

import Foundation

public class MergeSimilarItemsTestCase: TestCase {
    public var name: String = "Merge Similar Items"
    let items1: [[Int]]
    let items2: [[Int]]
    var result = [[Int]]()
    
    init(items1: [[Int]], items2: [[Int]]) {
        self.items1 = items1
        self.items2 = items2
    }
    
    public func run() {
        result = mergeSimilarItems(items1, items2)
    }
    
    func mergeSimilarItems(_ items1: [[Int]], _ items2: [[Int]]) -> [[Int]] {
        var stat = Array(repeating: 0, count: 1002)
        for i in 0..<items1.count {
            stat[items1[i][0]] += items1[i][1]
        }
        for i in 0..<items2.count {
            stat[items2[i][0]] += items2[i][1]
        }
        var res = [[Int]]()
        for i in 0..<stat.count {
            if stat[i] > 0 {
                res.append([i, stat[i]])
            }
        }
        return res
    }
    
    public static func test() -> Bool {
        let test = MergeSimilarItemsTestCase(items1: [[1,3],[2,2]], items2: [[7,1],[2,2],[1,4]])
        test.run()
        return test.result == [[1,7],[2,4],[7,1]]
    }
}
