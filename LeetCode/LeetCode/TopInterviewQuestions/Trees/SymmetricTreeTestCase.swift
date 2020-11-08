//
//  SymmetricTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 08.11.2020.
//

import Foundation

public class SymmetricTreeTestCase: BinaryTreeTestCase, TestCase {
    public var name: String = "Symmetric Tree"
    var result = false
    
    public func run() {
        result = isSymmetric(tree)
    }
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return isSymmetric(node1: root?.left, node2: root?.right)
    }
    
    func isSymmetric(node1: TreeNode?, node2: TreeNode?) -> Bool {
        if node1 == nil && node2 == nil {
            return true
        }
        if node1 != nil && node2 != nil && node1!.val == node2!.val {
            return isSymmetric(node1: node1!.left, node2: node2!.right) &&
                isSymmetric(node1: node1!.right, node2: node2!.left)
        }
        return false
    }
    
    public static func test() -> Bool {
        let arr = [2,1,1]
        let test = SymmetricTreeTestCase(withArray: arr)
        test.run()
        return test.result
    }
}
