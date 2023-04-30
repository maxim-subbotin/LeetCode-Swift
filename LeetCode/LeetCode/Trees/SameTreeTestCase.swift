//
//  SameTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 23.04.2023.
//

import Foundation

public class SameTreeTestCase: TestCase {
    public var name: String = "Same Tree"
    let tree1: TreeNode?
    let tree2: TreeNode?
    var result = false
    
    init(tree1: TreeNode?, tree2: TreeNode?) {
        self.tree1 = tree1
        self.tree2 = tree2
    }
    
    public func run() {
        result = isSameTree(tree1, tree2)
    }
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        guard let tree1 = p, let tree2 = q else { return false }
        return same(node1: tree1, node2: tree2)
    }
    
    func same(node1: TreeNode?, node2: TreeNode?) -> Bool {
        if node1 == nil && node2 == nil {
            return true
        } else if node1 == nil || node2 == nil {
            return false
        } else {
            if node1!.val == node2!.val {
                return same(node1: node1?.left, node2: node2?.left) && same(node1: node1?.right, node2: node2?.right)
            } else {
                return false
            }
        }
    }
    
    public static func test() -> Bool {
        let tree1 = TreeNode.from(array: [1,2,1])
        let tree2 = TreeNode.from(array: [1,1,2])
        let test = SameTreeTestCase(tree1: tree1, tree2: tree2)
        test.run()
        return test.result == false
    }
}
