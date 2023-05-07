//
//  NumberDifferentIntegersStringTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 07.05.2023.
//

import Foundation

public class NumberDifferentIntegersStringTestCase: TestCase {
    public var name: String = "Number of Different Integers in a String"
    let string: String
    var result = 0
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = numDifferentIntegers(string)
    }
    
    func numDifferentIntegers(_ word: String) -> Int {
        let chars = Array(word)
        var buffer = [Character]()
        var dict = [String: Int]()
        for i in 0..<chars.count {
            if chars[i].isNumber {
                buffer.append(chars[i])
            } else if buffer.count > 0 {
                let b = trim(arr: buffer)
                dict[String(b), default: 0] += 1
                buffer.removeAll()
            }
        }
        if buffer.count > 0 {
            let b = trim(arr: buffer)
            dict[String(b), default: 0] += 1
        }
        return dict.keys.count
    }
    
    func trim(arr: [Character]) -> [Character] {
        var res = [Character]()
        var skip = true
        for i in 0..<arr.count {
            if skip {
                skip = arr[i] == "0"
            }
            if !skip {
                res.append(arr[i])
            }
        }
        return res
    }
    
    public static func test() -> Bool {
        let test = NumberDifferentIntegersStringTestCase(string: "a123bc34d8ef034n340")
        test.run()
        return test.result == 4
    }
}
