//
//  AddDigitsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 23.03.2023.
//

import Foundation

public class AddDigitsTestCase: TestCase {
    public var name: String = "Add Digits"
    var n: Int
    var result: Int = 0
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = addDigits(n)
    }
    
    func addDigits(_ num: Int) -> Int {
        if num < 10 {
            return num
        } else {
            let n = sum(num: num)
            return addDigits(n)
        }
    }
    
    func sum(num: Int) -> Int {
        var s = 0
        var x = num
        while x > 0 {
            s += x % 10
            x = x / 10
        }
        return s
    }
    
    public static func test() -> Bool {
        let test = AddDigitsTestCase(n: 38)
        test.run()
        return test.result == 2
    }
}
