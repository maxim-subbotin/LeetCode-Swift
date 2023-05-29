//
//  MergeNodesInBetweenZerosTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 10.05.2023.
//

import Foundation

public class MergeNodesInBetweenZerosTestCase: TestCase {
    public var name: String = "Merge Nodes in Between Zeros"
    var head: ListNode?
    var result: ListNode?
    
    init(head: ListNode?) {
        self.head = head
    }
    
    public func run() {
        result = mergeNodes(head)
    }
    
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        var res: ListNode?
        var h: ListNode?
        var c = head
        var sum = 0
        while c != nil {
            if c!.val == 0 {
                if sum > 0 {
                    if res == nil {
                        res = ListNode(sum)
                        h = res
                    } else {
                        res?.next = ListNode(sum)
                        res = res?.next
                    }
                    sum = 0
                }
            } else {
                sum += c!.val
            }
            c = c?.next
        }
        return h
    }
    
    public static func test() -> Bool {
        let head = ListNode.from(array: [0,1,2,3,0,4,5,0,6,7,8,0])
        let test = MergeNodesInBetweenZerosTestCase(head: head)
        test.run()
        return test.result?.toArray() == [6, 9, 21]
    }
}
