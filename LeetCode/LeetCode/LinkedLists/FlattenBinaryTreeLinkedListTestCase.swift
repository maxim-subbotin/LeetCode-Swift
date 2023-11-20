//
//  FlattenBinaryTreeLinkedListTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 30.05.2023.
//

import Foundation

public class FlattenBinaryTreeLinkedListTestcase: TestCase {
    public var name: String = "Flatten Binary Tree to Linked List"
    let tree: TreeNode?
    var result: TreeNode?
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        flatten(tree)
        result = tree
    }
    
    func flatten(_ root: TreeNode?) {
        if root == nil { return }
        var res = [Int]()
        TLR(node: root, result: &res)
        let head = TreeNode(res[0])
        var current: TreeNode? = head
        var i = 1
        while i < res.count {
            current?.right = TreeNode(res[i])
            current = current?.right
            i += 1
        }
        root?.val = head.val
        root?.left = head.left
        root?.right = head.right
    }
    
    func TLR(node: TreeNode?, result: inout [Int]) {
        guard let node else { return }
        result.append(node.val)
        TLR(node: node.left, result: &result)
        TLR(node: node.right, result: &result)
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [1,2,5,3,4,nil,6])
        let test = FlattenBinaryTreeLinkedListTestcase(tree: tree)
        test.run()
        return test.tree?.LTR() == [1,2,3,4,5,6]
    }
}
