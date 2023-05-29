//
//  SumNodesEvenGrandparentTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 08.05.2023.
//

import Foundation

public class SumNodesEvenGrandparentTestCase: TestCase {
    public var name: String = "Sum of Nodes with Even-Valued Grandparent"
    let tree: TreeNode?
    var result = 0
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = sumEvenGrandparent(tree)
    }
    
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        var sum = 0
        grand(node: root, parent: nil, grandparent: nil, sum: &sum)
        return sum
    }
    
    func grand(node: TreeNode?, parent: TreeNode?, grandparent: TreeNode?, sum: inout Int) {
        guard let node else { return }
        if let grandparent, grandparent.val % 2 == 0 {
            sum += node.val
        }
        grand(node: node.left, parent: node, grandparent: parent, sum: &sum)
        grand(node: node.right, parent: node, grandparent: parent, sum: &sum)
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [6,7,8,2,7,1,3,9,nil,1,4,nil,nil,nil,5])
        let test = SumNodesEvenGrandparentTestCase(tree: tree)
        test.run()
        return test.result == 18
    }
}
