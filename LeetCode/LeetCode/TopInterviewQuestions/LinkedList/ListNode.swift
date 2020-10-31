//
//  ListNode.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 31.10.2020.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    func toArray() -> [Int] {
        var array = [val]
        var nextNode = next
        while nextNode != nil {
            array.append(nextNode!.val)
            nextNode = nextNode?.next
        }
        return array
    }
}
