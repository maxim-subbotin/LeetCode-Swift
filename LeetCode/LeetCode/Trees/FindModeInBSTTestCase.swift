//
//  FindModeInBSTTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 25.04.2023.
//

import Foundation

public class FindModeInBSTTestCase: TestCase {
    public var name: String = "Find Mode in Binary Search Tree"
    let tree: TreeNode?
    var result = [Int]()
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = findMode(tree)
    }
    
    func findMode(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        var dict = [Int:Int]()
        scan(root: root, dict: &dict)
        var count = [(Int, Int)]()
        dict.forEach { k, v in
            count.append((k, v))
        }
        count.sort { $0.1 > $1.1 }
        var res = [Int]()
        guard let first = count.first else {
            return []
        }
        var i = 0
        while i < count.count && count[i].1 == first.1 {
            res.append(count[i].0)
            i += 1
        }
        return res
    }
    
    func scan(root: TreeNode, dict: inout [Int: Int]) {
        if dict[root.val] == nil {
            dict[root.val] = 1
        } else {
            dict[root.val]! += 1
        }
        if let left = root.left {
            scan(root: left, dict: &dict)
        }
        if let right = root.right {
            scan(root: right, dict: &dict)
        }
    }
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [0])
        let test = FindModeInBSTTestCase(tree: tree)
        test.run()
        return test.result == [2]
    }
}
