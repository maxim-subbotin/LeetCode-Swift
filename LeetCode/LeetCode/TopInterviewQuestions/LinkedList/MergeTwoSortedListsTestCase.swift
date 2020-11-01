//
//  MergeTwoSortedListsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 01.11.2020.
//

import Foundation

public class MergeTwoSortedListsTestCase: LinkTestCase, TestCase {
    public var name: String = "Merge Two Sorted Lists"
    var head2: ListNode
    var result: ListNode?
    
    init(withArray arr1:[Int], andArray arr2:[Int]) {
        var prevNode: ListNode?
        for n in arr2.reversed() {
            let node = ListNode(n)
            node.next = prevNode
            prevNode = node
        }
        self.head2 = prevNode!
        
        super.init(withArray: arr1)
    }
    
    public func run() {
        result = mergeTwoLists(head, head2)
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        if l1!.val < l2!.val {
            l1!.next = mergeTwoLists(l1!.next, l2)
            return l1
        } else {
            l2!.next = mergeTwoLists(l1!, l2!.next)
            return l2
        }
    }
    
    public static func test() -> Bool {
        let arr1 = [1,2,4]
        let arr2 = [1,3,4]
        let test = MergeTwoSortedListsTestCase(withArray: arr1, andArray: arr2)
        test.run()
        return test.result?.toArray() == [1,1,2,3,4,4]
    }
}
