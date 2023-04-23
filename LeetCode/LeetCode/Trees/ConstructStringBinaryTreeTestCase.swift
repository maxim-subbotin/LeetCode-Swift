//
//  ConstructStringBinaryTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 22.04.2023.
//

import Foundation

public class ConstructStringBinaryTreeTestCase: TestCase {
    public var name: String = "Construct String from Binary Tree"
    let tree: TreeNode?
    var result = ""
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = tree2str(tree)
    }
    
    func tree2str(_ root: TreeNode?) -> String {
        guard let root else { return "" }
        var str = ""
        ltr(root: root, string: &str)
        var s = str.dropFirst()
        s = s.dropLast()
        return String(s)
    }
    
    func ltr(root: TreeNode, string: inout String) {
        string += "(\(root.val)"
        if root.left == nil && root.right == nil {
            string += ")"
            return
        }
        if root.left != nil {
            ltr(root: root.left!, string: &string)
        } else {
            string += "()"
        }
        if root.right != nil {
            ltr(root: root.right!, string: &string)
        }
        string += ")"
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [1,2,3,4])
        let test = ConstructStringBinaryTreeTestCase(tree: tree)
        test.run()
        return test.result == "1(2(4))(3)"
    }
}
