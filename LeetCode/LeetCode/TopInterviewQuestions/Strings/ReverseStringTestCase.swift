//
//  ReverseStringTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/29/20.
//

import Foundation

public class ReverseStringTestCase: TestCase {
    public var name: String = "Reverse String"
    var array: [Character]
    
    init(withArray arr: [Character]) {
        self.array = arr
    }
    
    public func run() {
        reverseString(&array)
    }
    
    func reverseString(_ s: inout [Character]) {
        if s.count < 2 {
            return
        }
        
        let lastIndex = s.count / 2 - 1
        for i in 0...lastIndex {
            let a = s[i]
            s[i] = s[s.count - i - 1]
            s[s.count - i - 1] = a
        }
    }
    
    public static func test() -> Bool {
        let testData:[Character] = ["h","e","l","l","o"]
        let test = ReverseStringTestCase(withArray: testData)
        test.run()
        return test.array == ["o","l","l","e","h"]
    }
}
