//
//  ReverseLinkedListTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 31.10.2020.
//

import Foundation

public class ReverseLinkedListTestCase: LinkTestCase, TestCase {
    public var name: String = "Reverse Linked List"
    var result: ListNode?
    
    public func run() {
        result = reverseList(head)
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        // lets find tail node
        var currentNode = head
        var length = 0
        while currentNode?.next != nil {
            currentNode = currentNode?.next
            length += 1
        }
        let newHeader = currentNode
        newHeader?.next = head
        currentNode = head?.next
        
        // current head will be a tail of new list
        newHeader?.next?.next = nil

        var index = 0
        while index < length - 1 {
            let nextNode = currentNode?.next
            currentNode?.next = newHeader?.next
            newHeader?.next = currentNode
            
            currentNode = nextNode
            index += 1
        }

        return newHeader
    }
    
    public static func test() -> Bool {
        let test = ReverseLinkedListTestCase(withArray: [1,2,3,4,5])
        test.run()
        return test.result?.toArray() == [5,4,3,2,1]
    }
}
