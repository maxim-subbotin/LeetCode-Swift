//
//  SubtreeAnotherTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 26.04.2023.
//

import Foundation

public class SubtreeAnotherTreeTestCase: TestCase {
    public var name: String = "Subtree of Another Tree"
    let tree1: TreeNode?
    let tree2: TreeNode?
    var result = false
    
    init(tree1: TreeNode?, tree2: TreeNode?) {
        self.tree1 = tree1
        self.tree2 = tree2
    }
    
    public func run() {
        result = isSubtree(tree1, tree2)
    }
    
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil && subRoot == nil {
            return true
        }
        if root != nil && subRoot == nil {
            return false
        }
        guard let root = root, let subRoot = subRoot else { return false }
        let v = subRoot.val
        var nodes = [TreeNode]()
        find(val: v, in: root, nodes: &nodes)
        for node in nodes {
            let isSame = same(node1: node, node2: subRoot)
            if isSame {
                return true
            }
        }
        return false
    }
    
    func find(val: Int, in root: TreeNode, nodes: inout [TreeNode]) {
        if root.val == val {
            nodes.append(root)
        }
        if let left = root.left {
            find(val: val, in: left, nodes: &nodes)
        }
        if let right = root.right {
            find(val: val, in: right, nodes: &nodes)
        }
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
    
    func ltr(root: TreeNode, array: inout [Int]) {
        if let left = root.left {
            ltr(root: left, array: &array)
        }
        array.append(root.val)
        if let right = root.right {
            ltr(root: right, array: &array)
        }
    }
    
    public static func test() -> Bool {
        let tree1 = TreeNode.from(array: [1,2,3])
        let tree2 = TreeNode.from(array: [1,2])
        let test = SubtreeAnotherTreeTestCase(tree1: tree1, tree2: tree2)
        test.run()
        return test.result == false
    }
}
