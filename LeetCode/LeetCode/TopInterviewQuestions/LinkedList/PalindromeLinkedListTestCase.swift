//
//  PalindromeLinkedListTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 01.11.2020.
//

import Foundation

public class PalindromeLinkedListTestCase: LinkTestCase, TestCase {
    public var name: String = "Palindrome Linked List"
    var result = false
    
    public func run() {
        result = isPalindrome(head)
    }
    
    
    //  001
    //  010
    //  011
    //  010
    //  001
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil {
            return true
        }
        if head?.next == nil {
            return true
        }
        
        var node = head?.next
        var values = [head!.val]
        while node != nil {
            values.append(node!.val)
            node = node?.next
        }
        
        var index = values.count - 1
        node = head
        while node != nil {
            if node!.val != values[index] {
                return false
            }
            node = node?.next
            index -= 1
        }
        
        return true
    }
    
    public static func test() -> Bool {
        let test = PalindromeLinkedListTestCase(withArray: [1,2,3,2,1])
        test.run()
        return test.result
    }
}
