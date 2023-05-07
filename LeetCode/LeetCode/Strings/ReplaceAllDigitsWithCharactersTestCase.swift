//
//  ReplaceAllDigitsWithCharactersTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 06.05.2023.
//

import Foundation

public class ReplaceAllDigitsWithCharactersTestCase: TestCase {
    public var name: String = "Replace All Digits with Characters"
    let string: String
    var result = ""
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = replaceDigits(string)
    }
    
    func replaceDigits(_ s: String) -> String {
        var bytes = [UInt8](s.utf8)
        for i in 0..<bytes.count {
            if bytes[i] >= 0x30 && bytes[i] <= 0x39 {
                bytes[i] = bytes[i - 1] + UInt8(bytes[i] - 0x30)
            }
        }
        return String(bytes: bytes, encoding: .ascii) ?? ""
    }
    
    public static func test() -> Bool {
        let test = ReplaceAllDigitsWithCharactersTestCase(string: "a1b2c3d4e")
        test.run()
        return test.result == "abbdcfdhe"
    }
}
