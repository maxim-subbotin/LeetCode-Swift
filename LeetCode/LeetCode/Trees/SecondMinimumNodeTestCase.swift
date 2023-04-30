//
//  SecondMinimumNodeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 27.04.2023.
//

import Foundation

public class SecondMinimumNodeTestCase: TestCase {
    public var name: String = "Second Minimum Node In a Binary Tree"
    let tree: TreeNode?
    var result = 0
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = findSecondMinimumValue(tree)
    }
    
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        guard let root else { return -1 }
        minVal = root.val
        scan(tree: root)
        return secondMin < Int.max ? secondMin : -1
    }
    
    var minVal = 0
    var secondMin = Int.max
    
    func scan(tree: TreeNode?) {
        guard let tree else { return }
        if minVal < tree.val && tree.val < secondMin {
            secondMin = tree.val
        } else if minVal == tree.val {
            scan(tree: tree.left)
            scan(tree: tree.right)
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [2,2,5,nil,nil,5,7])
        let test = SecondMinimumNodeTestCase(tree: tree)
        test.run()
        return test.result == 5
    }
}
