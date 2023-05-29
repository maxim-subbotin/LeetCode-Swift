//
//  DeepestLeavesSumTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 07.05.2023.
//

import Foundation

public class DeepestLeavesSumTestCase: TestCase {
    public var name: String = "Deepest Leaves Sum"
    let tree: TreeNode?
    var result = 0
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = deepestLeavesSum(tree)
    }
    
    typealias Leaf = (level: Int, val: Int)
    func deepestLeavesSum(_ root: TreeNode?) -> Int {
        var leaves = [Leaf]()
        findLeaf(node: root, level: 0, leaves: &leaves)
        var stat = [Int: Int]()
        var maxLevel = 0
        for leave in leaves {
            stat[leave.level, default: 0] += leave.val
            maxLevel = max(maxLevel, leave.level)
        }
        return stat[maxLevel] ?? 0
    }
    
    func findLeaf(node: TreeNode?, level: Int, leaves: inout [Leaf]) {
        guard let node else { return }
        if node.left == nil && node.right == nil {
            leaves.append((level: level, val: node.val))
        } else {
            findLeaf(node: node.left, level: level + 1, leaves: &leaves)
            findLeaf(node: node.right, level: level + 1, leaves: &leaves)
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [1,2,3,4,5,nil,6,7,nil,nil,nil,nil,8])
        let test = DeepestLeavesSumTestCase(tree: tree)
        test.run()
        return test.result == 15
    }
}
