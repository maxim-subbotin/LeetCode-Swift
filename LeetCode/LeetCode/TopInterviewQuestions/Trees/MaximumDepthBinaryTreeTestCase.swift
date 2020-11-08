//
//  MaximumDepthBinaryTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 08.11.2020.
//

import Foundation

public class MaximumDepthBinaryTreeTestCase: TestCase {
    public var name: String = "Maximum Depth of Binary Tree"
    var array: [Int?]
    var result = 0
    var tree: TreeNode?
    
    
    init(withArray arr: [Int?]) {
        self.array = arr
        tree = TreeNode.from(array: self.array)
    }
    
    public func run() {
        result = maxDepth(tree)
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let leftDepth = maxDepth(root?.left)
        let rightDepth = maxDepth(root?.right)
        return max(leftDepth, rightDepth) + 1
    }
    
    public static func test() -> Bool {
        let arr = [3,9,20,nil,nil,15,7]
        let test = MaximumDepthBinaryTreeTestCase(withArray: arr)
        test.run()
        return test.result == 3
    }
}
