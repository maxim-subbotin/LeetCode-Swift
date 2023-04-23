//
//  SumRootToLeafBinaryNumbersTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 19.04.2023.
//

import Foundation

public class SumRootToLeafBinaryNumbersTestCase: TestCase {
    public var name: String = "Sum of Root To Leaf Binary Numbers"
    let tree: TreeNode?
    var result = 0
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = sumRootToLeaf(tree)
    }
    
    func sumRootToLeaf(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }
        var c = [String]()
        move(root: root, arr: "", collector: &c)
        var sum = 0
        for a in c {
            if let n = Int(a, radix: 2) {
                sum += n
            }
        }
        return sum
    }
    
    func move(root: TreeNode, arr: String, collector: inout [String]) {
        let a = arr.appending("\(root.val)")
        if root.left == nil && root.right == nil {
            collector.append(a)
            return
        }
        if let left = root.left {
            move(root: left, arr: a, collector: &collector)
        }
        if let right = root.right {
            move(root: right, arr: a, collector: &collector)
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [1,0,1,0,1,0,1])
        let test = SumRootToLeafBinaryNumbersTestCase(tree: tree)
        test.run()
        return test.result == 22
    }
}
