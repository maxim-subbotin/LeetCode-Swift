//
//  ConstructBSTFromPreorderTraversalTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 08.05.2023.
//

import Foundation

public class ConstructBSTFromPreorderTraversalTestCase: TestCase {
    public var name: String = "Construct Binary Search Tree from Preorder Traversal"
    let array: [Int]
    var result: TreeNode?
    
    init(array: [Int]) {
        self.array = array
    }
    
    public func run() {
        result = bstFromPreorder(array)
    }
    
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        if preorder.isEmpty { return nil }
        let root = TreeNode(preorder[0])
        for i in 1..<preorder.count {
            place(val: preorder[i], node: root)
        }
        return root
    }
    
    func place(val: Int, node: TreeNode) {
        if val < node.val && node.left != nil {
            place(val: val, node: node.left!)
        } else if val < node.val {
            node.left = TreeNode(val)
        } else if val >= node.val && node.right != nil {
            place(val: val, node: node.right!)
        } else {
            node.right = TreeNode(val)
        }
    }
    
    public static func test() -> Bool {
        let test = ConstructBSTFromPreorderTraversalTestCase(array: [8,5,1,7,10,12])
        test.run()
        return test.result?.LTR() == [1,5,7,8,10,12]
    }
}
