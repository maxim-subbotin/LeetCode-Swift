//
//  DeleteNodeInLinkedListTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 31.10.2020.
//

import Foundation

public class LinkTestCase {
    var head: ListNode
    var nodes = [ListNode]()
    
    init(withArray arr: [Int]) {
        var prevNode: ListNode?
        for n in arr.reversed() {
            let node = ListNode(n)
            node.next = prevNode
            nodes.append(node)
            prevNode = node
        }
        head = prevNode!
    }
}

public class DeleteNodeInLinkedListTestCase: LinkTestCase, TestCase {
    public var name: String = "Delete Node in a Linked List"
    var deletingNode: ListNode?
    
    init(withArray arr: [Int], andDeleteNumber v: Int) {
        super.init(withArray: arr)
        for node in nodes {
            if node.val == v {
                deletingNode = node
            }
        }
    }
    
    public func run() {
        if let node = deletingNode {
            deleteNode(node)
        }
    }
    
    func deleteNode(_ node: ListNode?) {
        if let nextNode = node?.next {
            node?.val = nextNode.val
            node?.next = nextNode.next
        }
    }
    
    public static func test() -> Bool {
        let test = DeleteNodeInLinkedListTestCase(withArray: [4,5,1,9], andDeleteNumber: 1)
        test.run()
        return test.head.toArray() == [4,5,9]
    }
}
