//
//  MergeBetweenLinkedListsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 14.05.2023.
//

import Foundation

public class MergeBetweenLinkedListsTestCase: TestCase {
    public var name: String = "Merge In Between Linked Lists"
    let list1: ListNode?
    let list2: ListNode?
    let from: Int
    let to: Int
    var result: ListNode?
    
    init(list1: ListNode?, list2: ListNode?, from: Int, to: Int) {
        self.list1 = list1
        self.list2 = list2
        self.from = from
        self.to = to
    }
    
    public func run() {
        result = mergeInBetween(list1, from, to, list2)
    }
    
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        var index = 0
        var c = list1
        var head: ListNode?
        var tail: ListNode?
        while index <= b && c != nil {
            if index == a - 1 {
                head = c
            }
            if index == b {
                tail = c?.next
            }
            c = c?.next
            index += 1
        }
        head?.next = list2
        var h = list2
        var isEnd = false
        while !isEnd {
            if h?.next != nil {
                h = h?.next
            } else {
                isEnd = true
            }
        }
        h?.next = tail
        return list1
    }
    
    public static func test() -> Bool {
        let list1 = ListNode.from(array: [0,1,2,3,4,5])
        let list2 = ListNode.from(array: [1000000,1000001,1000002])
        let test = MergeBetweenLinkedListsTestCase(list1: list1, list2: list2, from: 3, to: 4)
        test.run()
        return test.result?.toArray() == [0,1,2,1000000,1000001,1000002,5]
    }
}
