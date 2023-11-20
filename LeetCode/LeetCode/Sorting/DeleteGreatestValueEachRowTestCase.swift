//
//  DeleteGreatestValueEachRowTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 03.06.2023.
//

import Foundation

public class DeleteGreatestValueEachRowTestCase: TestCase {
    public var name: String = "Delete Greatest Value in Each Row"
    let rows: [[Int]]
    var result = 0
    
    init(rows: [[Int]]) {
        self.rows = rows
    }
    
    public func run() {
        result = deleteGreatestValue(rows)
    }
    
    func deleteGreatestValue(_ grid: [[Int]]) -> Int {
        let sorted = grid.map { $0.sorted() }
        var total = 0
        for i in (0..<sorted[0].count).reversed() {
            var m = 0
            for j in 0..<sorted.count {
                m = max(m, sorted[j][i])
            }
            total += m
        }
        return total
    }
    
    /*
     1 2 4      4 2 1
     3 3 1      3 3 1
     */
    public static func test() -> Bool {
        let test = DeleteGreatestValueEachRowTestCase(rows: [[1,2,4],[3,3,1]])
        test.run()
        return test.result == 8
    }
}
