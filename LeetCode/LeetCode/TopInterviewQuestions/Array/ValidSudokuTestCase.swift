//
//  ValidSudokuTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/28/20.
//

import Foundation

public class ValidSudokuTestCase: TestCase {
    public var name: String = "Valid Sudoku"
    var array: [[Character]]
    var result = false
    
    init(withArray arr: [[Character]]) {
        self.array = arr
    }
    
    public func run() {
        result = isValidSudoku(array)
    }
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        // check rows
        for i in 0...8 {
            var arr = [Character]()
            for j in 0...8 {
                if board[j][i] == "." {
                    continue
                }
                if arr.contains(board[j][i]) {
                    return false
                } else {
                    arr.append(board[j][i])
                }
            }
        }
        // check columns
        for i in 0...8 {
            var arr = [Character]()
            for j in 0...8 {
                if board[i][j] == "." {
                    continue
                }
                if arr.contains(board[i][j]) {
                    return false
                } else {
                    arr.append(board[i][j])
                }
            }
        }
        let segments = [(0,0,3,3),
                        (3,0,3,3),
                        (6,0,3,3),
                        (0,3,3,3),
                        (3,3,3,3),
                        (6,3,3,3),
                        (0,6,3,3),
                        (3,6,3,3),
                        (6,6,3,3)]
        for segment in segments {
            if !checkArea(array: array, rect: segment) {
                return false
            }
        }
        
        return true
    }
    
    func checkArea(array: [[Character]], rect: (Int, Int, Int, Int)) -> Bool {
        let x = rect.0
        let y = rect.1
        let w = rect.2
        let h = rect.3
        var arr = [Character]()
        for i in x..<(x+w) {
            for j in y..<(y+h) {
                if array[i][j] != "." {
                    if arr.contains(array[i][j]) {
                        return false
                    } else {
                        arr.append(array[i][j])
                    }
                }
            }
        }
        return true
    }
    
    public static func test() -> Bool {
        let board: [[Character]] =
            [["5","3",".",".","7",".",".",".","."]
            ,["6",".",".","1","9","5",".",".","."]
            ,[".","9","8",".",".",".",".","6","."]
            ,["8",".",".",".","6",".",".",".","3"]
            ,["4",".",".","8",".","3",".",".","1"]
            ,["7",".",".",".","2",".",".",".","6"]
            ,[".","6",".",".",".",".","2","8","."]
            ,[".",".",".","4","1","9",".",".","5"]
            ,[".",".",".",".","8",".",".","7","9"]]
        let test = ValidSudokuTestCase(withArray: board)
        test.run()
        return test.result
    }
}
