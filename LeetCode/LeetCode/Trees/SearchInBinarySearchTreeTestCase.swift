//
//  SearchInBinarySearchTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 19.04.2023.
//

import Foundation

public class SearchInBinarySearchTreeTestCase: TestCase {
    public var name: String = "Search in a Binary Search Tree"
    let tree: TreeNode?
    let val: Int
    var result: TreeNode?
    
    init(tree: TreeNode?, val: Int) {
        self.tree = tree
        self.val = val
    }
    
    public func run() {
        result = searchBST(tree, val)
    }
    
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        search(root: root, val: val)
    }
    
    func search(root: TreeNode?, val: Int) -> TreeNode? {
        guard let root else { return nil }
        if root.val == val {
            return root
        } else if val < root.val {
            return search(root: root.left, val: val)
        } else {
            return searchBST(root.right, val)
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [4,2,7,1,3])
        let test = SearchInBinarySearchTreeTestCase(tree: tree, val: 2)
        test.run()
        let ans = TreeNode.from(array: [2,1,3])
        return test.result?.LTR() == ans.LTR()
    }
}
