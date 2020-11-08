//
//  BinaryTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 08.11.2020.
//

import Foundation

public class BinaryTreeTestCase {
    public var array: [Int?]
    public var tree: TreeNode?
    
    init(withArray arr: [Int?]) {
        self.array = arr
        tree = TreeNode.from(array: self.array)
    }
}
