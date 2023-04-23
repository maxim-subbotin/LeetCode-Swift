//
//  BinaryTreePathsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 22.04.2023.
//

import Foundation

public class BinaryTreePathsTestCase: TestCase {
    public var name: String = "Binary Tree Paths"
    let tree: TreeNode?
    var result = [String]()
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = binaryTreePaths(tree)
    }
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root else { return [] }
        var strs = [String]()
        path(root: root, path: "", paths: &strs)
        return strs
    }
    
    func path(root: TreeNode, path p: String, paths: inout [String]) {
        let p = p + (p.isEmpty ? "\(root.val)" : "->\(root.val)")
        if root.left == nil && root.right == nil {
            paths.append(p)
        } else {
            if let left = root.left {
                path(root: left, path: p, paths: &paths)
            }
            if let right = root.right {
                path(root: right, path: p, paths: &paths)
            }
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [1,2,3,nil,5])
        let test = BinaryTreePathsTestCase(tree: tree)
        test.run()
        return Set(test.result) == Set(["1->2->5","1->3"])
    }
}
