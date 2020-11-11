//
//  NumberOf1BitsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 11.11.2020.
//

import Foundation

public class NumberOf1BitsTestCase: TestCase {
    public var name: String = "Number of 1 Bits"
    var n: Int
    var result = -1
    
    init(withN n: Int) {
        self.n = n
    }
    
    public func run() {
        result = hammingWeight(n)
    }
    
    func hammingWeight(_ n: Int) -> Int {
        let ch = Array(String(n, radix: 2))
        return ch.filter({ $0 == "1" }).count
    }
    
    public static func test() -> Bool {
        let test = NumberOf1BitsTestCase(withN: 25)
        test.run()
        return test.result == 3
    }
}
