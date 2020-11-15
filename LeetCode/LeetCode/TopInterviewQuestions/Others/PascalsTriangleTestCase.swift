//
//  PascalsTriangleTestCase .swift
//  LeetCode
//
//  Created by Maxim Subbotin on 16.11.2020.
//

import Foundation

public class PascalsTriangleTestCase: TestCase {
    public var name: String = "Pascal's Triangle"
    var n: Int
    var result = [[Int]]()
    
    init(withN n: Int) {
        self.n = n
    }
    
    public func run() {
        result = generate(n)
    }
    
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 0 {
            return [[Int]]()
        }
        if numRows == 1 {
            return [[1]]
        }
        var array = [[1],[1,1]]
        if numRows == 2 {
            return array
        }
        for i in 2...(numRows - 1) {
            var arr = [1]
            for j in 1...(i - 1) {
                arr.append(array[i - 1][j - 1] + array[i - 1][j])
            }
            arr.append(1)
            array.append(arr)
        }
        return array
    }
    
    public static func test() -> Bool {
        let test = PascalsTriangleTestCase(withN: 5)
        test.run()
        return test.result ==   [[1],
                                [1,1],
                                [1,2,1],
                                [1,3,3,1],
                                [1,4,6,4,1]]
    }
}
