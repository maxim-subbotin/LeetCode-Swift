//
//  IncreasingDecreasingStringTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 13.04.2023.
//

import Foundation

public class IncreasingDecreasingStringTestCase: TestCase {
    public var name: String = "Increasing Decreasing String"
    let string: String
    var result = ""
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = sortString(string)
    }
    
    func sortString(_ s: String) -> String {
        let set = Set(s)
        let chars = set.sorted()
        var arr = [Character]()
        var reversed = false
        while arr.count < s.count {
            arr.append(contentsOf: reversed ?  chars.reversed() : chars)
            reversed = !reversed
        }
        return String(arr)
    }
    
    public static func test() -> Bool {
        let test = IncreasingDecreasingStringTestCase(string: "aaaabbbbcccc")
        test.run()
        return test.result == "abccbaabccba"
    }
}
