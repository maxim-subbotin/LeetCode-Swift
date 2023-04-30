//
//  MinimumDepthBinaryTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 27.04.2023.
//

import Foundation

public class MinimumDepthBinaryTree: TestCase {
    public var name: String = "Minimum Depth of Binary Tree"
    let tree: TreeNode?
    var result = 0
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result =  minDepth(tree)
    }
    
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var d = Int.max
        scan(root: root, level: 1, minDepth: &d)
        return d
    }
    
    func scan(root: TreeNode, level: Int, minDepth: inout Int) {
        if level >= minDepth {
            return
        }
        if root.left == nil && root.right == nil {
            minDepth = min(minDepth, level)
        }
        if let left = root.left {
            scan(root: left, level: level + 1, minDepth: &minDepth)
        }
        if let right = root.right {
            scan(root: right, level: level + 1, minDepth: &minDepth)
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [3,9,20,nil,nil,15,7])
        let test = MinimumDepthBinaryTree(tree: tree)
        test.run()
        return test.result == 2
    }
}
