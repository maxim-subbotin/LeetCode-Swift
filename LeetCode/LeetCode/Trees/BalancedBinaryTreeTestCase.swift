//
//  BalancedBinaryTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 25.04.2023.
//

import Foundation

public class BalancedBinaryTreeTestCase: TestCase {
    public var name: String = "Balanced Binary Tree"
    let tree: TreeNode?
    var result = false
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = isBalanced(tree)
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        let r = isBalancedTree(root: root)
        return r > 0
    }
    
    func isBalancedTree(root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let l = isBalancedTree(root: root?.left)
        if l == -1 {
            return -1
        }
        let r = isBalancedTree(root: root?.right)
        if r == -1 {
            return -1
        }
        if abs(l - r) > 1 {
            return -1
        } else {
            return max(l, r) + 1
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [3,9,20,nil,nil,15,7])
        let test = BalancedBinaryTreeTestCase(tree: tree)
        test.run()
        return test.result == true
    }
}
