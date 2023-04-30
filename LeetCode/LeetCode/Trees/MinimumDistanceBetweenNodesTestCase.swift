//
//  MinimumDistanceBetweenNodesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 24.04.2023.
//

import Foundation

public class MinimumDistanceBetweenNodesTestCase: TestCase {
    public var name: String = "Minimum Distance Between BST Nodes"
    let tree: TreeNode?
    var result = 0
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = minDiffInBST(tree)
    }
    
    func minDiffInBST(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var nums = [Int]()
        ltr(root: root, nums: &nums)
        var minD = Int.max
        for i in 0...(nums.count - 2) {
            minD = min(minD, nums[i + 1] - nums[i])
            if minD == 1 {
                return minD
            }
        }
        return minD
    }
    
    func ltr(root: TreeNode, nums: inout [Int]) {
        if let left = root.left {
            ltr(root: left, nums: &nums)
        }
        nums.append(root.val)
        if let right = root.right {
            ltr(root: right, nums: &nums)
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [1,0,48,nil,nil,12,49])
        let test = MinimumDistanceBetweenNodesTestCase(tree: tree)
        test.run()
        return test.result == 1
    }
}
