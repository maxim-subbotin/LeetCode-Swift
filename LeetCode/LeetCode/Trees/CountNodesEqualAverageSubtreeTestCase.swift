//
//  CountNodesEqualAverageSubtreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 08.05.2023.
//

import Foundation

public class CountNodesEqualAverageSubtreeTestCase: TestCase {
    public var name: String = "Count Nodes Equal to Average of Subtree"
    let tree: TreeNode?
    var result = 0
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = averageOfSubtree(tree)
    }
    
    func averageOfSubtree(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var t = 0
        _ = avg(node: root, total: &t)
        return t
    }
    
    typealias NodeInfo = (sum: Int, count: Int)
    func avg(node: TreeNode, total: inout Int) -> NodeInfo {
        if node.left == nil && node.right == nil {
            total += 1
            return (sum: node.val, count: 1)
        }
        var l = (sum: 0, count: 0)
        if let left = node.left {
            l = avg(node: left, total: &total)
        }
        var r = (sum: 0, count: 0)
        if let right = node.right {
            r = avg(node: right, total: &total)
        }
        let sum = l.sum + r.sum + node.val
        let c = l.count + r.count + 1
        let avg = sum / c
        if avg == node.val {
            total += 1
        }
        return (sum: sum, count: c)
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [4,8,5,0,1,nil,6])
        let test = CountNodesEqualAverageSubtreeTestCase(tree: tree)
        test.run()
        return test.result == 5
    }
}
