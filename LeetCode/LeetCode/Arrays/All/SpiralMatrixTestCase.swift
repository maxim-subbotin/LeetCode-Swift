//
//  SpiralMatrixTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 30.03.2023.
//

import Foundation

public class SpiralMatrixTestCase: TestCase {
    public var name: String = "Spiral Matrix"
    let matrix: [[Int]]
    var result = [Int]()
    
    init(matrix: [[Int]]) {
        self.matrix = matrix
    }
    
    public func run() {
        result = spiralOrder(matrix)
    }
    
    enum Dir {
        case right
        case down
        case left
        case up
    }
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        var i = 0
        var j = 0
        var rect = (minX: 0, minY: 1, maxX: matrix[0].count - 1, maxY: matrix.count - 1)
        var dir = Dir.right
        let max = matrix[0].count * matrix.count
        while res.count < max {
            res.append(matrix[j][i])
            if dir == .right {
                i += 1
                if i == rect.maxX + 1 {
                    dir = .down
                    i = rect.maxX
                    j += 1
                    rect.maxX -= 1
                }
            } else if dir == .down {
                j += 1
                if j == rect.maxY + 1 {
                    dir = .left
                    i -= 1
                    j = rect.maxY
                    rect.maxY -= 1
                }
            } else if dir == .left {
                i -= 1
                if i == rect.minX - 1 {
                    dir = .up
                    i = rect.minX
                    j -= 1
                    rect.minX += 1
                }
            } else if dir == .up {
                j -= 1
                if j == rect.minY - 1 {
                    dir = .right
                    j = rect.minY
                    i += 1
                    rect.minY += 1
                }
            }
        }
        
        return res
    }
    
    public static func test() -> Bool {
        let test = SpiralMatrixTestCase(matrix: [[1,2,3,4],[5,6,7,8],[9,10,11,12]])
        test.run()
        return test.result == [1,2,3,4,8,12,11,10,9,5,6,7]
    }
}
