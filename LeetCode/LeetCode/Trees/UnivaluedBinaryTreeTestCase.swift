//
//  UnivaluedBinaryTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 20.04.2023.
//

import Foundation

public class UnivaluedBinaryTreeTestCase: TestCase {
    public var name: String = "Univalued Binary Tree"
    let tree: TreeNode?
    var result = false
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = isUnivalTree(tree)
    }
    
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root else { return false }
        return isEqual(root: root, val: root.val)
    }
    
    func isEqual(root: TreeNode, val: Int) -> Bool {
        if root.val != val { return false }
        var l = true
        var r = true
        if let left = root.left {
            l = isEqual(root: left, val: val)
        }
        if let right = root.right {
            r = isEqual(root: right, val: val)
        }
        return l && r
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [2,2,2,5,2])
        let test = UnivaluedBinaryTreeTestCase(tree: tree)
        test.run()
        return test.result == false
    }
}
