//
//  ReverseBitsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 15.11.2020.
//

import Foundation

public class ReverseBitsTestCase: TestCase {
    public var name: String = "Reverse Bits"
    var n: Int
    var result = -1
    
    init(withN n: Int) {
        self.n = n
    }
    
    public func run() {
        result = reverseBits(n)
    }
    
    func reverseBits(_ n: Int) -> Int {
        var bitString = String(n, radix: 2)
        let n = 32 - bitString.count
        bitString = Array(repeating: "0", count: n).joined() + bitString
        let bits = Array(bitString.reversed())
        var x = 1
        var k = 0
        for i in (0..<bits.count).reversed() {
            if bits[i] == "1" {
                k += x
            }
            x *= 2
        }
        return k
    }
    
    public static func test() -> Bool {
        let test = ReverseBitsTestCase(withN: 1000)
        test.run()
        return test.result == 1
    }
}
