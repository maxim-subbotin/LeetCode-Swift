//
//  IncreasingOrderSearchTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 18.04.2023.
//

import Foundation

public class IncreasingOrderSearchTreeTestCase: TestCase {
    public var name: String = "Increasing Order Search Tree"
    let tree: TreeNode?
    var result: TreeNode?
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = increasingBST(tree)
    }
    
    func increasingBST(_ root: TreeNode?) -> TreeNode? {
        guard let root else {
            return nil
        }
        let sorted = LTR(root: root)
        if let start = sorted.first {
            let first = TreeNode(start)
            var node = first
            for i in 1..<sorted.count {
                let r = TreeNode(sorted[i])
                node.right = r
                node = r
            }
            return first
        } else {
            return nil
        }
    }
    
    private func LTR(root: TreeNode) -> [Int] {
        let l = root.left != nil ? LTR(root: root.left!) : [Int]()
        let t = root.val
        let r = root.right != nil ? LTR(root: root.right!) : [Int]()
        return l + [t] + r
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [5,3,6,2,4,nil,8,1,nil,nil,nil,7,9])
        let test = IncreasingOrderSearchTreeTestCase(tree: tree)
        test.run()
        let res = TreeNode.from(array: [1,nil,2,nil,3,nil,4,nil,5,nil,6,nil,7,nil,8,nil,9])
        return test.result?.LTR() == res.LTR()
    }
}
