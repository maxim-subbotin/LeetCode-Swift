//
//  PathSumTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 25.04.2023.
//

import Foundation

public class PathSumTestCase: TestCase {
    public var name: String = "Path Sum"
    let tree: TreeNode?
    let target: Int
    var result = false
    
    init(tree: TreeNode?, target: Int) {
        self.tree = tree
        self.target = target
    }
    
    public func run() {
        result = hasPathSum(tree, target)
    }
    
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root else { return false }
        var vals = Set<Int>()
        sum(root: root, target: targetSum, sum: 0, vals: &vals)
        return vals.contains(targetSum)
    }
    
    func sum(root: TreeNode, target: Int, sum s: Int, vals: inout Set<Int>) {
        let ns = s + root.val
        if root.left == nil && root.right == nil {
            vals.insert(ns)
        }
        if let left = root.left {
            sum(root: left, target: target, sum: ns, vals: &vals)
        }
        if let right = root.right {
            sum(root: right, target: target, sum: ns, vals: &vals)
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [5,4,8,11,nil,13,4,7,2,nil,nil,nil,1])
        let test = PathSumTestCase(tree: tree, target: 22)
        test.run()
        return test.result == true
    }
}
