//
//  LeafSimilarTreesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 22.04.2023.
//

import Foundation

public class LeafSimilarTreesTestCase: TestCase {
    public var name: String = "Leaf-Similar Trees"
    let tree1: TreeNode?
    let tree2: TreeNode?
    var result = false
    
    init(_ tree1: TreeNode?, _ tree2: TreeNode?) {
        self.tree1 = tree1
        self.tree2 = tree2
    }
    
    public func run() {
        result = leafSimilar(tree1, tree2)
    }
    
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        guard let root1, let root2 else {
            return false
        }
        var leafs1 = [Int]()
        leaf(root: root1, values: &leafs1)
        var leafs2 = [Int]()
        let r = leafCheck(root: root2, values: &leafs2, array: leafs1)
        return r && leafs1.count == leafs2.count
    }
    
    func leaf(root: TreeNode, values: inout [Int]) {
        if root.left == nil && root.right == nil {
            values.append(root.val)
        } else {
            if root.left != nil {
                leaf(root: root.left!, values: &values)
            }
            if root.right != nil {
                leaf(root: root.right!, values: &values)
            }
        }
    }
    
    func leafCheck(root: TreeNode, values: inout [Int], array: [Int]) -> Bool {
        if root.left == nil && root.right == nil {
            values.append(root.val)
            let index = values.count - 1
            if index < array.count {
                return root.val == array[index]
            } else {
                return false
            }
        } else {
            var a = true
            if root.left != nil {
                a = leafCheck(root: root.left!, values: &values, array: array)
            }
            var b = true
            if root.right != nil {
                b = leafCheck(root: root.right!, values: &values, array: array)
            }
            return a && b
        }
    }
    
    public static func test() -> Bool {
        // [3,5,1,6,7,4,2,null,null,null,null,null,null,9,11,null,null,8,10]
        // [3,5,1,6,2,9,8,null,null,7,4]
        let tree1 = TreeNode.from(array: [3,5,1,6,7,4,2,nil,nil,nil,nil,nil,nil,9,11,nil,nil,8,10])
        let tree2 = TreeNode.from(array: [3,5,1,6,2,9,8,nil,nil,7,4])
        let test = LeafSimilarTreesTestCase(tree1, tree2)
        test.run()
        return test.result == true
    }
}
