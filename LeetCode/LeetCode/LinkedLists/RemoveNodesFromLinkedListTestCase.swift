//
//  RemoveNodesFromLinkedListTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 14.05.2023.
//

import Foundation

public class RemoveNodesFromLinkedListTestCase: TestCase {
    public var name: String = "Remove Nodes From Linked List"
    let head: ListNode?
    var result: ListNode?
    
    init(head: ListNode?) {
        self.head = head
    }
    
    public func run() {
        result = removeNodes(head)
    }
    
    func removeNodes(_ head: ListNode?) -> ListNode? {
        var arr = [Int]()
        var c = head
        while c != nil {
            if let v = c?.val {
                arr.append(v)
            }
            c = c?.next
        }
        var list: ListNode?
        var m = 0
        for i in (0..<arr.count).reversed() {
            if arr[i] >= m {
                if list == nil {
                    list = ListNode(arr[i])
                } else {
                    let h = ListNode(arr[i])
                    h.next = list
                    list = h
                }
                m = arr[i]
            }
        }
        
        return list
    }
    
    public static func test() -> Bool {
        let head = ListNode.from(array: [5,2,13,3,8])
        let test = RemoveNodesFromLinkedListTestCase(head: head)
        test.run()
        return test.result?.toArray() == [13,8]
    }
}
