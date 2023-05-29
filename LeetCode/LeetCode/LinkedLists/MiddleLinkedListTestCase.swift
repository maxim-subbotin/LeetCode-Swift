//
//  MiddleLinkedListTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 09.05.2023.
//

import Foundation

public class MiddleLinkedListTestCase: TestCase {
    public var name: String = "Middle of the Linked List"
    let head: ListNode?
    var result: ListNode?
    
    init(head: ListNode?) {
        self.head = head
    }
    
    public func run() {
        result = middleNode(head)
    }
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        var index = 0
        var c: ListNode? = head
        while c != nil {
            index += 1
            c = c?.next
        }
        let h = index / 2
        index = 0
        c = head
        while index < h {
            c = c?.next
            index += 1
        }
        return c
    }
    
    public static func test() -> Bool {
        let node = ListNode.from(array: [1,2,3,4,5])
        let test = MiddleLinkedListTestCase(head: node)
        test.run()
        return test.result?.toArray() == [3,4,5]
    }
}
