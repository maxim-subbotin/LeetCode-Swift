//
//  MergeTwoBinaryTreesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 17.04.2023.
//

import Foundation

public class MergeTwoBinaryTreesTestCase: TestCase {
    public var name: String = "Merge Two Binary Trees"
    let tree1: TreeNode?
    let tree2: TreeNode?
    var result: TreeNode?
    
    init(tree1: TreeNode?, tree2: TreeNode?) {
        self.tree1 = tree1
        self.tree2 = tree2
    }
    
    public func run() {
        result = mergeTrees(tree1, tree2)
    }
    
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 else { return root2 }
        guard let root2 else { return root1 }
        return merge(root1: root1, root2: root2)
    }
    
    func merge(root1: TreeNode?, root2: TreeNode?) -> TreeNode? {
        if root1 == nil && root2 == nil {
            return nil
        }
        let s = (root1?.val ?? 0) + (root2?.val ?? 0)
        var res = TreeNode(s)
        res.left = merge(root1: root1?.left, root2: root2?.left)
        res.right = merge(root1: root1?.right, root2: root2?.right)
        return res
    }
    
    public static func test() -> Bool {
        let tree1 = TreeNode.from(array: [1,3,2,5])
        let tree2 = TreeNode.from(array: [2,1,3,nil,4,nil,7])
        let test = MergeTwoBinaryTreesTestCase(tree1: tree1, tree2: tree2)
        test.run()
        let ans = TreeNode.from(array: [3,4,5,5,4,nil,7])
        return test.result?.LTR() == ans.LTR()
    }
}
