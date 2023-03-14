//
//  MultiplyStringsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 13.03.2023.
//

import Foundation

public class MultiplyStringsTestCase: TestCase {
    public var name: String = "Multiply Strings"
    private var s1: String
    private var s2: String
    var result: String?
    
    init(_ s1: String, _ s2: String) {
        self.s1 = s1
        self.s2 = s2
    }
    
    public func run() {
        result = multiply(s1, s2)
    }

    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" { return "0" }
        if num1 == "1" { return num2 }
        if num2 == "1" { return num1 }
        let bytes1 = ([UInt8](num1.utf8)).map({ $0 - 48 })
        let bytes2 = ([UInt8](num2.utf8)).map({ $0 - 48 })
        
        let res = mult(a: bytes1, b: bytes2).map({ $0 + 48 })
        return String(bytes: res, encoding: .ascii) ?? ""
    }
    
    func mult(a: [UInt8], b: [UInt8]) -> [UInt8] {
        var a = a
        a.reverse()
        var b = b
        b.reverse()
        let n = a.count + b.count
        var result = Array(repeating: UInt8(0), count: n)
        for i in 0..<b.count {
            for j in 0..<a.count {
                let pos = i + j
                let m = a[j] * b[i] + result[pos]
                result[pos] = m % 10
                result[pos + 1] = result[pos + 1] + m / 10
            }
        }
        if result[result.count - 1] == 0 {
            result.remove(at: result.count - 1)
        }
        result.reverse()
        return result
    }
    
    public static func test() -> Bool {
        let test = MultiplyStringsTestCase("123456", "789")
        test.run()
        return (test.result ?? "") == "97406784"
    }
}
