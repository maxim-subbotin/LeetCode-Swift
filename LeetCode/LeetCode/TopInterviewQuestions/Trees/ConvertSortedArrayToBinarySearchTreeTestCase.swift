//
//  ConvertSortedArrayToBinarySearchTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 11.11.2020.
//

import Foundation

public class ConvertSortedArrayToBinarySearchTreeTestCase: TestCase {
    public var name: String = "Convert Sorted Array to Binary Search Tree"
    var array: [Int]
    var result: TreeNode?
    
    init(withArray arr: [Int]) {
        array = arr
    }
    
    public func run() {
        result = sortedArrayToBST(array.compactMap({ $0 }))
    }
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return sort(array: nums, from: 0, to: nums.count - 1)
    }
    
    func sort(array: [Int], from: Int, to: Int) -> TreeNode? {
        if from > to {
            return nil
        }
        let mid = (from + to) / 2
        let node = TreeNode(array[mid])
        node.left = sort(array: array, from: from, to: mid - 1)
        node.right = sort(array: array, from: mid + 1, to: to)
        return node
    }
    
    public static func test() -> Bool {
        let data = [-10,-3,0,5,9]
        let test = ConvertSortedArrayToBinarySearchTreeTestCase(withArray: data)
        test.run()
        var order = [Int]()
        test.result?.order(array: &order)
        return order == data
    }
}
