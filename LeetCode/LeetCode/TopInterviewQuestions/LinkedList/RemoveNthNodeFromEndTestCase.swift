//
//  RemoveNthNodeFromEndTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 31.10.2020.
//

import Foundation

public class RemoveNthNodeFromEndTestCase: LinkTestCase, TestCase {
    public var name: String = "Remove Nth Node From End of List"
    var n: Int
    var result: ListNode?
    
    init(withArray arr: [Int], andN n: Int) {
        self.n = n
        super.init(withArray: arr)
    }
    
    public func run() {
        result = removeNthFromEnd(head, n)
    }
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var index = 0
        let dummy = ListNode(-1)
        dummy.next = head
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
            index += 1
        }
        index -= n
        currentNode = dummy
        while index >= 0 {
            currentNode = currentNode?.next
            index -= 1
        }
        currentNode?.next = currentNode?.next?.next
        return dummy.next
    }
    
    public static func test() -> Bool {
        let test = RemoveNthNodeFromEndTestCase(withArray: [1,2,3,4,5], andN: 2)
        test.run()
        return test.result?.toArray() == [1,2,3,5]
    }
}
