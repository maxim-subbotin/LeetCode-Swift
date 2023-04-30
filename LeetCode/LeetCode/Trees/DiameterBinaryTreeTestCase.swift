//
//  DiameterBinaryTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 24.04.2023.
//

import Foundation

public class DiameterBinaryTreeTestCase: TestCase {
    public var name: String = "Diameter of Binary Tree"
    let tree: TreeNode?
    var result = 0
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = diameterOfBinaryTree(tree)
    }
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard var root else { return 0 }
        var max = 0
        _ = deep(root: &root, max: &max)
        return max
    }
    
    func deep(root: inout TreeNode, max m: inout Int) -> Int {
        if root.left == nil && root.right == nil {
            root.val = 0
            return 0
        } else {
            var l = 0
            if var left = root.left {
                l = deep(root: &left, max: &m) + 1
            }
            var r = 0
            if var right = root.right {
                r = deep(root: &right, max: &m) + 1
            }
            let lvl = l + r
            root.val = lvl
            m = max(m, lvl)
            return max(l, r)
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [1,2,3,4,5])
        let test = DiameterBinaryTreeTestCase(tree: tree)
        test.run()
        return test.result == 3
    }
}
