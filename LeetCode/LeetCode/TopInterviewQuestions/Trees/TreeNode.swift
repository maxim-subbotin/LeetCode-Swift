//
//  TreeNode.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 06.11.2020.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    public static func from(array: [Int?]) -> TreeNode {
        let tree = getNode(array: array, i: 0)
        return tree ?? TreeNode()
    }
    
    static func getNode(array arr: [Int?], i: Int) -> TreeNode? {
        if i >= arr.count {
            return nil
        }
        if let v = arr[i] {
            let node = TreeNode(v)
            node.left = getNode(array: arr, i: 2 * i + 1)
            node.right = getNode(array: arr, i: 2 * i + 2)
            return node
        }
        return nil
    }
    
    public func order(array: inout [Int]) {
        order(node: self, array: &array)
    }
    
    public func order(node root: TreeNode?, array: inout [Int]) {
        if root != nil {
            order(node: root!.left, array: &array)
            array.append(root!.val)
            order(node: root!.right, array: &array)
        }
    }
    
    func LTR() -> [Int] {
        LTR(root: self)
    }
    
    private func LTR(root: TreeNode) -> [Int] {
        let l = root.left != nil ? LTR(root: root.left!) : [Int]()
        let t = root.val
        let r = root.right != nil ? LTR(root: root.right!) : [Int]()
        return l + [t] + r
    }
}

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}
