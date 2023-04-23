//
//  RangeSumBSTTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 16.04.2023.
//

import Foundation

public class RangeSumBSTTestCase: TestCase {
    public var name: String = "Range Sum of BST"
    let tree: TreeNode
    let low: Int
    let high: Int
    var result = 0
    
    init(tree: TreeNode, low: Int, high: Int) {
        self.tree = tree
        self.low = low
        self.high = high
    }
    
    public func run() {
        result = rangeSumBST(tree, low, high)
    }
    
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root else { return 0 }
        var sum = 0
        down(node: root, low: low, high: high, sum: &sum)
        return sum
    }
    
    func down(node: TreeNode, low: Int, high: Int, sum: inout Int) {
        if node.val >= low && node.val <= high {
            sum += node.val
        }
        if let left = node.left, node.val > low {
            down(node: left, low: low, high: high, sum: &sum)
        }
        if let right = node.right, node.val < high {
            down(node: right, low: low, high: high, sum: &sum)
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [10,5,15,3,7,13,18,1,nil,6])
        let test = RangeSumBSTTestCase(tree: tree, low: 6, high: 10)
        test.run()
        return test.result == 23
    }
}
