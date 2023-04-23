//
//  InvertBinaryTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 19.04.2023.
//

import Foundation

public class InvertBinaryTreeTestCase: TestCase {
    public var name: String = "Invert Binary Tree"
    let tree: TreeNode?
    var result: TreeNode?
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = invertTree(tree)
    }
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        var node = root
        invert(root: &node)
        return root
    }
    
    func invert(root: inout TreeNode?) {
        guard let root else { return }
        invert(root: &root.left)
        invert(root: &root.right)
        let x = root.left
        root.left = root.right
        root.right = x
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [4,2,7,1,3,6,9])
        let test = InvertBinaryTreeTestCase(tree: tree)
        test.run()
        let ans = TreeNode.from(array: [4,7,2,9,6,3,1])
        return test.result?.LTR() == ans.LTR()
    }
}
