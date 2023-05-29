//
//  ConvertBinaryNumberInLinkedListToIntegerTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 09.05.2023.
//

import Foundation

public class ConvertBinaryNumberInLinkedListToIntegerTestCase: TestCase {
    public var name: String = "Convert Binary Number in a Linked List to Integer"
    let list: ListNode?
    var result = 0
    
    init(list: ListNode?) {
        self.list = list
    }
    
    public func run() {
        result = getDecimalValue(list)
    }
    
    func getDecimalValue(_ head: ListNode?) -> Int {
        guard let head else { return 0 }
        var array = [Int]()
        var c: ListNode? = head
        while c != nil {
            array.append(c!.val)
            c = c?.next
        }
        var s = 0
        var g = 1
        for i in (0..<array.count).reversed() {
            s += array[i] * g
            g *= 2
        }
        return s
    }
    
    public static func test() -> Bool {
        let list = ListNode.from(array: [1,0,1])
        let test = ConvertBinaryNumberInLinkedListToIntegerTestCase(list: list)
        test.run()
        return test.result == 5
    }
}
