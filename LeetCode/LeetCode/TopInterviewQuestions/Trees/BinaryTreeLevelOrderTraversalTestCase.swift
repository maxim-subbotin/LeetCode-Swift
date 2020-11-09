//
//  BinaryTreeLevelOrderTraversalTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 10.11.2020.
//

import Foundation
import SwiftUI

public class BinaryTreeLevelOrderTraversalTestCase: BinaryTreeTestCase, TestCase {
    public var name: String = "Binary Tree Level Order Traversal"
    var result = [[Int]]()
    
    public func run() {
        result = levelOrder(tree)
    }
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return [[Int]]()
        }
        
        let h = height(root)
        var arr = [(Int,Int)]()
        for i in 1...h {
            level(node: root, level: i, realLevel: i, arr: &arr)
        }
        
        var res = [[Int]]()
        var i = 0
        var currentLevel = 1
        var currentArray = [Int]()
        while i < arr.count {
            if arr[i].0 == currentLevel {
                currentArray.append(arr[i].1)
            } else {
                res.append(currentArray)
                currentArray = [arr[i].1]
                currentLevel += 1
            }
            i += 1
        }
        res.append(currentArray)
        return res
    }
    
    func height(_ node:TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        let left = height(node?.left)
        let right = height(node?.right)
        return max(left, right) + 1
    }
    
    func level(node: TreeNode?, level l: Int, realLevel L: Int, arr: inout [(Int,Int)]) {
        if node == nil {
            return
        }
        if l == 1 {
            arr.append((L, node!.val))
        } else if l > 1 {
            level(node: node?.left, level: l - 1, realLevel: L, arr: &arr)
            level(node: node?.right, level: l - 1, realLevel: L, arr: &arr)
        }
    }
    
    public static func test() -> Bool {
        let arr = [3,9,20,nil,nil,15,7]
        let test = BinaryTreeLevelOrderTraversalTestCase(withArray: arr)
        test.run()
        return test.result == [[3],[9,20],[15,7]]
    }
}
