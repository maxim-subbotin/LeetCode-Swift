//
//  ValidateBinarySearchTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 08.11.2020.
//

import Foundation

public class ValidateBinarySearchTreeTestCase: BinaryTreeTestCase, TestCase {
    public var name: String = "Validate Binary Search Tree"
    var result = false
    
    public func run() {
        result = isValidBST(tree)
    }
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        
        var array = [Int]()
        order(root, array: &array)
        for i in 0..<(array.count - 1) {
            if array[i + 1] <= array[i] {
                return false
            }
        }
        return true
    }
    
    func order(_ root: TreeNode?, array: inout [Int]) {
        if root != nil {
            order(root!.left, array: &array)
            array.append(root!.val)
            order(root!.right, array: &array)
        }
    }
    
    public static func test() -> Bool {
        let arr = [3,9,20,nil,nil,15,7]
        let test = ValidateBinarySearchTreeTestCase(withArray: arr)
        test.run()
        return test.result
    }
}
