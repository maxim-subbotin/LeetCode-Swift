//
//  BinaryTreePreorderTraversalTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 22.04.2023.
//

import Foundation

public class BinaryTreePreorderTraversalTestCase: TestCase {
    public var name: String = "Binary Tree Preorder Traversal"
    let tree: TreeNode?
    var result = [Int]()
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = preorderTraversal(tree)
    }
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        var array = [Int]()
        TLR(root: root, values: &array)
        return array
    }
    
    func TLR(root: TreeNode, values: inout [Int]) {
        values.append(root.val)
        if root.left != nil {
            TLR(root: root.left!, values: &values)
        }
        if root.right != nil {
            TLR(root: root.right!, values: &values)
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [1,nil,2,3])
        let test = BinaryTreePreorderTraversalTestCase(tree: tree)
        test.run()
        return test.result == [1,2,3]
    }
}
