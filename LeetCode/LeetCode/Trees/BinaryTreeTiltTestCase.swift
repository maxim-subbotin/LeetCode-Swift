//
//  BinaryTreeTiltTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 23.04.2023.
//

import Foundation

public class BinaryTreeTiltTestCase: TestCase {
    public var name: String = "Binary Tree Tilt"
    let tree: TreeNode?
    var result = 0
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = findTilt(tree)
    }
    
    func findTilt(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var sum = 0
        deep(root: root, total: &sum)
        return sum
    }
    
    func deep(root: TreeNode, total: inout Int) {
        var l = 0
        if root.left != nil {
            l = sum(root: root.left!)
            deep(root: root.left!, total: &total)
        }
        var r = 0
        if root.right != nil {
            r = sum(root: root.right!)
            deep(root: root.right!, total: &total)
        }
        total += abs(l - r)
    }
    
    func sum(root: TreeNode) -> Int {
        var l = 0
        var r = 0
        if root.left != nil {
            l = sum(root: root.left!)
        }
        if root.right != nil {
            r = sum(root: root.right!)
        }
        return l + root.val + r
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [4,2,9,3,5,nil,7])
        let test = BinaryTreeTiltTestCase(tree: tree)
        test.run()
        return test.result == 15
    }
}
