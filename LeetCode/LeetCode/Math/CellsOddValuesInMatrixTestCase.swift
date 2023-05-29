//
//  CellsOddValuesInMatrixTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 20.05.2023.
//

import Foundation

public class CellsOddValuesInMatrixTestCase: TestCase {
    public var name: String = "Cells with Odd Values in a Matrix"
    let m: Int
    let n: Int
    let indexes: [[Int]]
    var result = 0
    
    init(m: Int, n: Int, indexes: [[Int]]) {
        self.m = m
        self.n = n
        self.indexes = indexes
    }
    
    public func run() {
        result = oddCells(m, n, indexes)
    }
    
    func oddCells(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
        var matrix = Array(repeating: Array(repeating: 0, count: n), count: m)
        var odds = 0
        for pair in indices {
            for i in 0..<n {
                matrix[pair[0]][i] += 1
            }
            for i in 0..<m {
                matrix[i][pair[1]] += 1
            }
        }
        for i in 0..<n {
            for j in 0..<m {
                if matrix[j][i].trailingZeroBitCount == 0 {
                    odds += 1
                }
            }
        }
        return odds
    }
    
    public static func test() -> Bool {
        let test = CellsOddValuesInMatrixTestCase(m: 2, n: 3, indexes: [[0,1],[1,1]])
        test.run()
        return test.result == 6
    }
}
