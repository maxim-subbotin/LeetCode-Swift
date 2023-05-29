//
//  MaximumTwinSumLinkedListTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 11.05.2023.
//

import Foundation

public class MaximumTwinSumLinkedListTestCase: TestCase {
    public var name: String = "Maximum Twin Sum of a Linked List"
    let head: ListNode?
    var result = 0
    
    init(head: ListNode?) {
        self.head = head
    }
    
    public func run() {
        result = pairSum(head)
    }
    
    func pairSum(_ head: ListNode?) -> Int {
        var array = [Int]()
        var c = head
        while c != nil {
            array.append(c!.val)
            c = c?.next
        }
        var m = 0
        for i in 0..<(array.count / 2) {
            let a = array[i] + array[array.count - i - 1]
            m = max(a, m)
        }
        return m
    }
    
    public static func test() -> Bool {
        let head = ListNode.from(array: [1,2,3,10,12,14])
        let test = MaximumTwinSumLinkedListTestCase(head: head)
        test.run()
        return test.result == 15
    }
}
