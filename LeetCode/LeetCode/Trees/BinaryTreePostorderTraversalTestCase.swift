//
//  BinaryTreePostorderTraversalTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 22.04.2023.
//

import Foundation

public class BinaryTreePostorderTraversalTestCase: TestCase {
    public var name: String = "Binary Tree Postorder Traversal"
    let tree: TreeNode?
    var result = [Int]()
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = postorderTraversal(tree)
    }
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var arr = [Int]()
        post(root: root, values: &arr)
        return arr
    }
    
    func post(root: TreeNode?, values: inout [Int]) {
        guard let root else { return }
        post(root: root.left, values: &values)
        post(root: root.right, values: &values)
        values.append(root.val)
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [1,nil,2,3])
        let test = BinaryTreePostorderTraversalTestCase(tree: tree)
        test.run()
        return test.result == [3,2,1]
    }
}
