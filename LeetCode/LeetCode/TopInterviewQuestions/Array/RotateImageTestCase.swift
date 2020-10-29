//
//  RotateImageTestCase.swift
//  LeetCode
//
//  Created by Snappii on 10/29/20.
//

import Foundation

public class RotateImageTestCase: TestCase {
    public var name: String = "Rotate Image"
    var array: [[Int]]
    
    init(withArray arr: [[Int]]) {
        self.array = arr
    }
    
    
    public func run() {
        rotate(&array)
    }
    
    func rotate(_ matrix: inout [[Int]]) {
        // i - row number
        // j - number of element
        let size = matrix.count
        let half = size / 2
        for i in 0..<half {
            let currentSize = size - 2 * i
            
            if currentSize == 1 {
                continue
            }
            
            for j in i..<(i + currentSize - 1) {
                let currentOffset = j - i
                let p1 = (i,j)
                let p2 = (i + currentOffset, i + currentSize - 1)
                let p3 = (size - i - 1, i + currentSize - currentOffset - 1)
                let p4 = (i + currentSize - currentOffset - 1, i)
                let a = matrix[p4.0][p4.1]
                matrix[p4.0][p4.1] = matrix[p3.0][p3.1]
                matrix[p3.0][p3.1] = matrix[p2.0][p2.1]
                matrix[p2.0][p2.1] = matrix[p1.0][p1.1]
                matrix[p1.0][p1.1] = a
                
            }
        }
    }
    
    public static func test() -> Bool {
        let testData = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
        let test = RotateImageTestCase(withArray: testData)
        test.run()
        for str in test.array {
            print(str)
        }
        return test.array == [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
    }
}
