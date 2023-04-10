//
//  SetMatrixZeroesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 01.04.2023.
//

import Foundation

public class SetMatrixZeroesTestCases: TestCase {
    public var name: String = "Set Matrix Zeroes"
    let matrix: [[Int]]
    var result = [[Int]]()
    
    init(matrix: [[Int]]) {
        self.matrix = matrix
    }
    
    public func run() {
        result = matrix
        setZeroes(&result)
    }
    
    func setZeroes(_ matrix: inout [[Int]]) {
        var rows = Set<Int>()
        var columns = Set<Int>()
        for i in 0..<matrix[0].count {
            for j in 0..<matrix.count {
                if matrix[j][i] == 0 {
                    rows.insert(j)
                    columns.insert(i)
                }
            }
        }
        for r in rows {
            matrix[r] = Array(repeating: 0, count: matrix[r].count)
        }
        for c in columns {
            for i in 0..<matrix.count {
                matrix[i][c] = 0
            }
        }
    }
    
    public static func test() -> Bool {
        let test = SetMatrixZeroesTestCases(matrix: [[0,1,2,0],[3,4,5,2],[1,3,1,5]])
        test.run()
        return test.result == [[0,0,0,0],[0,4,5,0],[0,3,1,0]]
    }
}
