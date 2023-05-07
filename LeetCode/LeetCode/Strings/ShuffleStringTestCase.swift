//
//  ShuffleStringTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 02.05.2023.
//

import Foundation

public class ShuffleStringTestCase: TestCase {
    public var name: String = "Shuffle String"
    let string: String
    let indexes: [Int]
    var result = ""
    
    init(string: String, indexes: [Int]) {
        self.string = string
        self.indexes = indexes
    }
    
    public func run() {
        result = restoreString(string, indexes)
    }
    
    func restoreString(_ s: String, _ indices: [Int]) -> String {
        let chars = Array(s)
        var res: [Character] = Array(repeating: " ", count: chars.count)
        for i in 0..<indices.count {
            res[indices[i]] = chars[i]
        }
        return String(res)
    }
    
    public static func test() -> Bool {
        let test = ShuffleStringTestCase(string: "codeleet", indexes: [4,5,6,7,0,2,1,3])
        test.run()
        return test.result == "leetcode"
    }
}
