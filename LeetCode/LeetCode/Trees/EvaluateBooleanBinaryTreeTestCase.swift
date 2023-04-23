//
//  EvaluateBooleanBinaryTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 19.04.2023.
//

import Foundation

public class EvaluateBooleanBinaryTreeTestCase: TestCase {
    public var name: String = "Evaluate Boolean Binary Tree"
    let tree: TreeNode?
    var result = false
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = evaluateTree(tree)
    }
    
    func evaluateTree(_ root: TreeNode?) -> Bool {
        guard let root else {
            return false
        }
        return eval(root: root)
    }
    
    func eval(root: TreeNode) -> Bool {
        if let left = root.left, let right = root.right {
            let a = eval(root: left)
            let b = eval(root: right)
            if root.val == 2 {
                return a || b
            } else {
                return a && b
            }
        } else {
            return root.val == 0 ? false : true
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [2,1,3,nil,nil,0,1])
        let test = EvaluateBooleanBinaryTreeTestCase(tree: tree)
        test.run()
        return test.result == true
    }
}
