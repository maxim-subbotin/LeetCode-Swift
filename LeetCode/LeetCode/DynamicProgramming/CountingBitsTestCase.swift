//
//  CountingBitsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 29.04.2023.
//

import Foundation

public class CountingBitsTestCase: TestCase {
    public var name: String = "Counting Bits"
    let n: Int
    var result = [Int]()
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = countBits(n)
    }
    
    func countBits(_ n: Int) -> [Int] {
        var bits = Array(repeating: 0, count: n + 1)
        var isOdd = false
        for i in 0...n {
            if isOdd {
                bits[i] = bits[i - 1] + 1
            } else {
                bits[i] = bits[i / 2]
            }
            isOdd = !isOdd
        }
        return bits
    }
    
    public static func test() -> Bool {
        let test = CountingBitsTestCase(n: 5)
        test.run()
        return test.result == [0,1,1,2,1,2]
    }
}
