//
//  SumLeftLeavesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 24.04.2023.
//

import Foundation

public class SumLeftLeavesTestCase: TestCase {
    public var name: String = "Sum of Left Leaves"
    let tree: TreeNode?
    var result = 0
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = sumOfLeftLeaves(tree)
    }
    
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var s = 0
        sum(root: root, sum: &s, isLeft: true)
        return s
    }
    
    func sum(root: TreeNode, sum s: inout Int, isLeft: Bool) {
        if root.left == nil && root.right == nil && isLeft {
            s += root.val
        } else {
            if let left = root.left {
                sum(root: left, sum: &s, isLeft: true)
            }
            if let right = root.right {
                sum(root: right, sum: &s, isLeft: false)
            }
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [3,9,20,nil,nil,15,7])
        let test = SumLeftLeavesTestCase(tree: tree)
        test.run()
        return test.result == 24
    }
}
