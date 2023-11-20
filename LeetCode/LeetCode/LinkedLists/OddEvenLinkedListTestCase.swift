//
//  OddEvenLinkedListTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 30.05.2023.
//

import Foundation

public class OddEvenLinkedListTestCase: TestCase {
    public var name: String = "Odd Even Linked List"
    let head: ListNode?
    var result: ListNode?
    
    init(head: ListNode) {
        self.head = head
    }
    
    public func run() {
        result = oddEvenList(head)
    }
    
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var evenHead: ListNode?
        var currentEven: ListNode?
        var oddHead: ListNode?
        var currentOdd: ListNode?
        var isOdd = true
        var current = head
        while current != nil {
            if isOdd {
                if oddHead == nil {
                    oddHead = current
                    currentOdd = oddHead
                } else {
                    currentOdd?.next = current
                    currentOdd = current
                }
            } else {
                if evenHead == nil {
                    evenHead = current
                    currentEven = evenHead
                } else {
                    currentEven?.next = current
                    currentEven = current
                }
            }
            current = current?.next
            isOdd = !isOdd
        }
        if !isOdd {
            currentEven?.next = nil
        } else {
            currentOdd?.next = nil
        }
        currentOdd?.next = evenHead
        return oddHead
    }
    
    public static func test() -> Bool {
        let test = OddEvenLinkedListTestCase(head: ListNode.from(array: [2,1,3,5,6,4,7]))
        test.run()
        return test.result?.toArray() == [2,3,6,7,1,5,4]
    }
}
