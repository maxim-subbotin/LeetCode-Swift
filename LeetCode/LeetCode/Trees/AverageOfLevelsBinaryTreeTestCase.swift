//
//  AverageOfLevelsBinaryTreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 20.04.2023.
//

import Foundation

public class AverageOfLevelsBinaryTreeTestCase: TestCase {
    public var name: String = "Average of Levels in Binary Tree"
    let tree: TreeNode?
    var result = [Double]()
    
    init(tree: TreeNode?) {
        self.tree = tree
    }
    
    public func run() {
        result = averageOfLevels(tree)
    }
    
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root else { return [] }
        var levels = [Int: [Int]]()
        scan(root: root, level: 0, levels: &levels)
        let res = levels.keys.sorted().map({ Double(levels[$0]!.reduce(0, +)) / Double(levels[$0]!.count) })
        return res
    }
    
    func scan(root: TreeNode, level: Int, levels: inout [Int: [Int]]) {
        if levels[level] == nil {
            levels[level] = [root.val]
        } else {
            levels[level]?.append(root.val)
        }
        if let left = root.left {
            scan(root: left, level: level + 1, levels: &levels)
        }
        if let right = root.right {
            scan(root: right, level: level + 1, levels: &levels)
        }
    }
    
    
    public static func test() -> Bool {
        let tree = TreeNode.from(array: [3,9,20,nil,nil,15,7])
        let test = AverageOfLevelsBinaryTreeTestCase(tree: tree)
        test.run()
        return test.result == [3, 14.5, 11]
    }
}
