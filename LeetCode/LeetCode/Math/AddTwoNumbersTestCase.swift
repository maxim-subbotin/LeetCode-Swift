//
//  AddTwoNumbersTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 13.03.2023.
//

import Foundation

public class AddTwoNumbersTestCase: TestCase {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() {
            self.val = 0;
            self.next = nil;
        }
        public init(_ val: Int) {
            self.val = val;
            self.next = nil;
        }
        public init(_ val: Int, _ next: ListNode?) {
            self.val = val;
            self.next = next;
        }
    }
    
    public var name: String = "Add Two Numbers"
    private var a: ListNode
    private var b: ListNode
    var result: ListNode?
    
    init(a: ListNode, b: ListNode) {
        self.a = a
        self.b = b
    }
    
    public func run() {
        result = addTwoNumbers(a, b)
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var next = true
        var a = l1
        var b = l2
        let sum = ListNode()
        var res = sum
        var addOne = false
        while next {
            let s = (a?.val ?? 0) + (b?.val ?? 0) + (addOne ? 1 : 0)
            if s < 10 {
                res.val = s
                addOne = false
            } else {
                res.val = s - 10
                addOne = true
            }
            a = a?.next
            b = b?.next
            next = a != nil || b != nil
            if next {
                let n = ListNode()
                res.next = n
                res = n
            } else if addOne {
                res.next = ListNode(1)
            }
        }
        return sum
    }
    
    public static func test() -> Bool {
        let a = ListNode(2)
        a.next = ListNode(4)
        a.next?.next = ListNode(3)
        let b = ListNode(5)
        b.next = ListNode(6)
        b.next?.next = ListNode(4)
        let test = AddTwoNumbersTestCase(a: a, b: b)
        test.run()
        if let r = test.result {
            return r.val == 7 && r.next?.val == 0 && r.next?.next?.val == 8
        }
        return false
    }
}
