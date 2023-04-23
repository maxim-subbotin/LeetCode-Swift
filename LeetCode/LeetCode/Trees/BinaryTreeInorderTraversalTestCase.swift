//
//  TreeNode.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 16.04.2023.
//

import Foundation

public class BinaryTreeInorderTraversalTestCase: TestCase {
    public var name: String = "Binary Tree Inorder Traversal"
    let tree: TreeNode
    var result = [Int]()
    
    init(tree: TreeNode) {
        self.tree = tree
    }
    
    public func run() {
        result = inorderTraversal(tree)
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if let root {
            return LTR(root: root)
        } else {
            return [Int]()
        }
    }
    
    func LTR(root: TreeNode) -> [Int] {
        let l = root.left != nil ? LTR(root: root.left!) : [Int]()
        let t = root.val
        let r = root.right != nil ? LTR(root: root.right!) : [Int]()
        return l + [t] + r
    }
    
    public static func test() -> Bool {
        let tree = TreeNode(1, TreeNode(2, TreeNode(3), nil), TreeNode(4, TreeNode(5), TreeNode(6)))
        let test = BinaryTreeInorderTraversalTestCase(tree: tree)
        test.run()
        return test.result == [3, 2, 1, 5, 4, 6]
    }
}
