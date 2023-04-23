//
//  TwoSumIVTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 22.04.2023.
//

import Foundation

public class TwoSumIVTestCase: TestCase {
    public var name: String = "Two Sum IV"
    let tree: TreeNode?
    let k: Int
    var result = false
    
    init(tree: TreeNode?, k: Int) {
        self.tree = tree
        self.k = k
    }
    
    public func run() {
        result = findTarget(tree, k)
    }
    
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {
        guard let root else { return false }
        var nodes = Set<Int>()
        next(root: root, k: k, nodes: &nodes)
        for n in nodes {
            if n < k, nodes.contains(k - n) {
                return true
            }
        }
        return false
    }
    
    func next(root: TreeNode, k: Int, nodes: inout Set<Int>) {
        nodes.insert(root.val)
        if root.left != nil {
            next(root: root.left!, k: k, nodes: &nodes)
        }
        if root.right != nil {
            next(root: root.right!, k: k, nodes: &nodes)
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [5,3,6,2,4,nil,7])
        let test = TwoSumIVTestCase(tree: tree, k: 9)
        test.run()
        return test.result == true
    }
}
