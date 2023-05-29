//
//  SpiralMatrixIVTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 11.05.2023.
//

import Foundation

public class SpiralMatrixIVTestCase: TestCase {
    public var name: String = "Spiral Matrix IV"
    let m: Int
    let n: Int
    let head: ListNode?
    var result = [[Int]]()
    
    init(m: Int, n: Int, head: ListNode?) {
        self.m = m
        self.n = n
        self.head = head
    }
    
    public func run() {
        result = spiralMatrix(m, n, head)
    }
    
    enum Dir {
        case right
        case down
        case left
        case up
    }
    func spiralMatrix(_ m: Int, _ n: Int, _ head: ListNode?) -> [[Int]] {
        var matrix = Array(repeating: Array(repeating: -1, count: n), count: m)
        var col = 0
        var row = 0
        var index = 0
        var c = head
        var dir = Dir.right
        var lvl = 0
        var run = true
        while run {
            matrix[row][col] = c?.val ?? -1
            if dir == .right {
                col += 1
                if col == n - lvl {
                    col -= 1
                    row += 1
                    dir = .down
                }
            } else if dir == .down {
                row += 1
                if row == m - lvl {
                    row -= 1
                    col -= 1
                    dir = .left
                }
            } else if dir == .left {
                col -= 1
                if col == lvl - 1 {
                    col += 1
                    row -= 1
                    dir = .up
                }
            } else if dir == .up {
                row -= 1
                if row == lvl{
                    row += 1
                    col += 1
                    dir = .right
                    lvl += 1
                }
            }
            c = c?.next
            index += 1
            run = index < m * n && c != nil
        }
        return matrix
    }
    
    public static func test() -> Bool {
        let head = ListNode.from(array: [515,942,528,483,20,159,868,999,474,320,734,956,12,124,224,252,909,732])
        let test = SpiralMatrixIVTestCase(m: 4, n: 5, head: head)
        test.run()
        return test.result == [[515,942,528,483,20],[124,224,252,909,159],[12,-1,-1,732,868],[956,734,320,474,999]]
    }
}
