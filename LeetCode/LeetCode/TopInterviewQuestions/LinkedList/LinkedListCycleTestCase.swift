//
//  LinkedListCycleTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 01.11.2020.
//

import Foundation

public class LinkedListCycleTestCase: LinkTestCase, TestCase {
    public var name: String = "Linked List Cycle"
    var result = false
    
    override init(withArray arr: [Int]) {
        super.init(withArray: arr)
        head.next?.next?.next = head.next
    }
    
    public func run() {
        result = hasCycle(head)
    }
    
    func hasCycle(_ head: ListNode?) -> Bool {
        var node = head
        
        let emptyNode = ListNode(Int.max)
        while node != nil {
            if node?.next == nil {
                return false
            }
            if node!.next?.val == Int.max{
                return true
            }
            let nextNode = node?.next
            node?.next = emptyNode
            node = nextNode
        }
        
        return false
    }
    
    public static func test() -> Bool {
        let test = LinkedListCycleTestCase(withArray: [1,2,3,4,5])
        test.run()
        return test.result
    }
}
