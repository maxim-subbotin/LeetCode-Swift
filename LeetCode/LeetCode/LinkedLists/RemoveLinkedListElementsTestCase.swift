//
//  RemoveLinkedListElementsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 10.05.2023.
//

import Foundation

public class RemoveLinkedListElementsTestCase: TestCase {
    public var name: String = "Remove Linked List Elements"
    let head: ListNode?
    let val: Int
    var result: ListNode?
    
    init(head: ListNode?, val: Int) {
        self.head = head
        self.val = val
    }
    
    public func run() {
        result = removeElements(head, val)
    }
    
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var res: ListNode?
        var h: ListNode?
        var cur = head
        while cur != nil {
            if cur?.val != val {
                if res == nil {
                    res = ListNode(cur!.val)
                    h = res
                } else {
                    res?.next = ListNode(cur!.val)
                    res = res?.next
                }
            }
            cur = cur?.next
        }
        return h
    }
    
    public static func test() -> Bool {
        let head = ListNode.from(array: [1,2,6,3,4,5,6])
        let test = RemoveLinkedListElementsTestCase(head: head, val: 6)
        test.run()
        return test.result?.toArray() == [1,2,3,4,5]
    }
}
