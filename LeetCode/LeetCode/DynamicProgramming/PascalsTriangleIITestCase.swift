//
//  PascalsTriangleIITestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 30.04.2023.
//

import Foundation

public class PascalsTriangleIITestCase: TestCase {
    public var name: String = "Pascal's Triangle II"
    let index: Int
    var result = [Int]()
    
    init(index: Int) {
        self.index = index
    }
    
    public func run() {
        result = getRow(index)
    }
    
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 { return [1] }
        var array = [1,1]
        for _ in 1..<rowIndex {
            var c = [1,1]
            for j in 1...(array.count - 1) {
                c.insert(array[j - 1] + array[j], at: j)
            }
            array = c
        }
        return array
    }
    
    public static func test() -> Bool {
        let test = PascalsTriangleIITestCase(index: 3)
        test.run()
        return test.result == [1,3,3,1]
    }
}
