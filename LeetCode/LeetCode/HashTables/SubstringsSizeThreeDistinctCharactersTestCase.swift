//
//  SubstringsSizeThreeDistinctCharactersTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 25.05.2023.
//

import Foundation

public class SubstringsSizeThreeDistinctCharactersTestCase: TestCase {
    public var name: String = "Substrings of Size Three with Distinct Characters"
    let string: String
    var result = 0
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = countGoodSubstrings(string)
    }
    
    func countGoodSubstrings(_ s: String) -> Int {
        guard s.count > 2 else { return 0 }
        let chars = Array(s)
        var total = 0
        for i in 0..<chars.count - 2 {
            let set = Set(chars[i...(i+2)])
            if set.count == 3 {
                total += 1
            }
        }
        return total
    }
    
    public static func test() -> Bool {
        let test = SubstringsSizeThreeDistinctCharactersTestCase(string: "aababcabc")
        test.run()
        return test.result == 4
    }
}
