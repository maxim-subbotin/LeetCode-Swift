//
//  LinkedListRandomNodeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 16.05.2023.
//

import Foundation

public class LinkedListRandomNodeTestCase: TestCase {
    class Solution {
        var n = -1
        var head: ListNode?
        
        init(_ head: ListNode?) {
            self.head = head
            n = 0
            var c = head
            while c != nil {
                c = c?.next
                n += 1
            }
        }
        
        func getRandom() -> Int {
            let r = Int.random(in: 1...n)
            var l = 1
            var c = head
            while l < r {
                c = c?.next
                l += 1
            }
            return c?.val ?? -1
        }
    }
    let head: ListNode?
    public var name: String = "Linked List Random Node"
    var result = -1
    
    init(head: ListNode?) {
        self.head = head
    }
    
    public func run() {
        let s = Solution(head)
        result = s.getRandom()
    }
    
    public static func test() -> Bool {
        let head = ListNode.from(array: [1, 2, 3])
        let test = LinkedListRandomNodeTestCase(head: head)
        test.run()
        return true
    }
}
