//
//  CousinsBinaryTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 25.04.2023.
//

import Foundation

public class CousinsBinaryTreeTestCase: TestCase {
    public var name: String = "Cousins in Binary Tree"
    let tree: TreeNode?
    let x: Int
    let y: Int
    var result = false
    
    init(tree: TreeNode?, x: Int, y: Int) {
        self.x = x
        self.y = y
        self.tree = tree
    }
    
    public func run() {
        result = isCousins(tree, x, y)
    }
    
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        guard let root else { return false }
        let l1 = find(root: root, item: x, level: 0, parent: root)
        let l2 = find(root: root, item: y, level: 0, parent: root)
        guard let l1, let l2 else { return false }
        return (l1.0 == l2.0) && (l1.1.val != l2.1.val)
    }
    
    func find(root: TreeNode, item: Int, level: Int, parent: TreeNode) -> (Int, TreeNode)? {
        if root.val == item {
            return (level, parent)
        }
        if root.left == nil && root.right == nil {
            return nil
        }
        if let left = root.left, let l = find(root: left, item: item, level: level + 1, parent: root) {
            return l
        }
        if let right = root.right, let r = find(root: right, item: item, level: level + 1, parent: root) {
            return r
        }
        return nil
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [1,2,3,nil,4])
        let test = CousinsBinaryTreeTestCase(tree: tree, x: 2, y: 3)
        test.run()
        return test.result == true
    }
}
