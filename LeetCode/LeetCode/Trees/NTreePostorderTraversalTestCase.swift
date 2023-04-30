//
//  NTreePostorderTraversalTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 28.04.2023.
//

import Foundation

public class NTreePostorderTraversalTestCase: TestCase {
    public var name: String = "N-ary Tree Postorder Traversal"
    let node: Node?
    var result = [Int]()
    
    init(node: Node?) {
        self.node = node
    }
    
    public func run() {
        result = postorder(node)
    }
    
    func postorder(_ root: Node?) -> [Int] {
        var vals = [Int]()
        post(node: root, vals: &vals)
        return vals
    }
    
    func post(node: Node?, vals: inout [Int]) {
        guard let node else { return }
        for n in node.children {
            post(node: n, vals: &vals)
        }
        vals.append(node.val)
    }
    
    public static func test() -> Bool {
        let tree = Node(1)
        tree.children.append(Node(2))
        tree.children.append(Node(3))
        let n = Node(4)
        n.children.append(Node(5))
        n.children.append(Node(6))
        tree.children.append(n)
        let test = NTreePostorderTraversalTestCase(node: tree)
        test.run()
        return test.result == [2,3,5,6,4,1]
    }
}
