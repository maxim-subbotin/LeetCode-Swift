//
//  ToLowerCaseTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 05.05.2023.
//

import Foundation

public class ToLowerCaseTestCase: TestCase {
    public var name: String = "To Lower Case"
    let string: String
    var result = ""
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = toLowerCase(string)
    }
    
    func toLowerCase(_ s: String) -> String {
        var bytes = [UInt8](s.utf8)
        for i in 0..<bytes.count {
            if bytes[i] >= 0x41 && bytes[i] <= 0x5A {
                bytes[i] += 32
            }
        }
        return String(bytes: bytes, encoding: .ascii) ?? ""
    }
    
    public static func test() -> Bool {
        let test = ToLowerCaseTestCase(string: "AbCdEfG")
        test.run()
        return test.result == "abcdefg"
    }
}
