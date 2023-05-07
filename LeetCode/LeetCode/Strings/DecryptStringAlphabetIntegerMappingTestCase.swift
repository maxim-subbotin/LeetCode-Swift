//
//  DecryptStringAlphabetIntegerMappingTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 07.05.2023.
//

import Foundation

public class DecryptStringAlphabetIntegerMappingTestCase: TestCase {
    public var name: String = "Decrypt String from Alphabet to Integer Mapping"
    let string: String
    var result = ""
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = freqAlphabets(string)
    }
    
    /*
     a - 97
     j - 106
     z - 122
     # - 35
     0 - 48
     9 - 57
     */
    func freqAlphabets(_ s: String) -> String {
        let bytes = [UInt8](s.utf8)
        var addToBuffer = false
        var buffer = [UInt8]()
        var result = [UInt8]()
        for i in (0..<bytes.count).reversed() {
            if bytes[i] == 35 {
                addToBuffer = true
            } else if bytes[i] >= 48 && bytes[i] <= 57 {
                if addToBuffer {
                    buffer.append(bytes[i])
                    if buffer.count == 2 {
                        let b = ((buffer[0] - 48) + 10 * (buffer[1] - 48) - 10) + 106
                        result.append(b)
                        buffer.removeAll()
                        addToBuffer = false
                    }
                } else {
                    let b = 96 + (bytes[i] - 48)
                    result.append(b)
                }
            }
        }
        return String(bytes: result.reversed(), encoding: .ascii) ?? ""
    }
    
    public static func test() -> Bool {
        let test = DecryptStringAlphabetIntegerMappingTestCase(string: "10#11#12")
        test.run()
        return test.result == "jkab"
    }
}
