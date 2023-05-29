//
//  BinarySearchTreeToGreaterSumTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 07.05.2023.
//

import Foundation

public class BinarySearchTreeToGreaterSumTreeTestCase: TestCase {
    public var name: String = "Binary Search Tree to Greater Sum Tree"
    let tree: TreeNode?
    var result: TreeNode?
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = bstToGst(tree)
    }
    
    func bstToGst(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        var sum = 0
        RTL(root: root, sum: &sum)
        return root
    }
    
    func RTL(root: TreeNode?, sum: inout Int) {
        guard let root else { return }
        RTL(root: root.right, sum: &sum)
        sum += root.val
        root.val = sum
        RTL(root: root.left, sum: &sum)
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [4,1,6,0,2,5,7,nil,nil,nil,3,nil,nil,nil,8])
        let test = BinarySearchTreeToGreaterSumTreeTestCase(tree: tree)
        test.run()
        return test.result?.LTR() == [36,36,35,33,30,26,21,15,8]
    }
}
