//
//  RemoveDuplicatesFromSortedListTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 10.05.2023.
//

import Foundation

public class RemoveDuplicatesFromSortedListTestCase: TestCase {
    public var name: String = "Remove Duplicates from Sorted List"
    let head: ListNode?
    var result: ListNode?
    
    init(head: ListNode?) {
        self.head = head
    }
    
    public func run() {
        result = deleteDuplicates(head)
    }
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head else { return nil }
        var v = head.val
        var c: ListNode? = head
        var res = ListNode(v)
        var curRes = res
        c = c?.next
        while c != nil {
            if c?.val != v {
                curRes.next = ListNode(c!.val)
                curRes = curRes.next!
            }
            v = c!.val
            c = c?.next
        }
        return res
    }
    
    public static func test() -> Bool {
        let head = ListNode.from(array: [1,1,2,3,3,3,4])
        let test = RemoveDuplicatesFromSortedListTestCase(head: head)
        test.run()
        return test.result?.toArray() == [1,2,3,4]
    }
}
