//
//  SwappingNodesLinkedListTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 14.05.2023.
//

import Foundation

public class SwappingNodesLinkedListTestCase: TestCase {
    public var name: String = "Swapping Nodes in a Linked List"
    let head: ListNode?
    let k: Int
    var result: ListNode?
    
    init(head: ListNode, k: Int) {
        self.head = head
        self.k = k
    }
    
    public func run() {
        result = swapNodes(head, k)
    }
    
    func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
        var c = head
        var nodes = [ListNode]()
        while c != nil {
            nodes.append(c!)
            c = c?.next
        }
        c = nodes[k - 1]
        let n = nodes[nodes.count - k]
        let v = c?.val
        c?.val = n.val
        n.val = v ?? 0
        return head
    }
    
    public static func test() -> Bool {
        let head = ListNode.from(array: [7,9,6,6,7,8,3,0,9,5])
        let test = SwappingNodesLinkedListTestCase(head: head, k: 5)
        test.run()
        return test.result?.toArray() == [7,9,6,6,8,7,3,0,9,5]
    }
}
