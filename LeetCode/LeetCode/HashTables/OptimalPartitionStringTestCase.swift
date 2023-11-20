//
//  OptimalPartitionStringTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 29.05.2023.
//

import Foundation

public class OptimalPartitionStringTestCase: TestCase {
    public var name: String = "Optimal Partition of String"
    let string: String
    var result = 0
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = partitionString(string)
    }
    
    func partitionString(_ s: String) -> Int {
        var stat = [Set<Character>]()
        var current = Set<Character>()
        for char in Array(s) {
            if !current.contains(char) {
                current.insert(char)
            } else {
                stat.append(current)
                current = Set([char])
            }
        }
        if current.count > 0 {
            stat.append(current)
        }
        return stat.count
    }
    
    public static func test() -> Bool {
        let test = OptimalPartitionStringTestCase(string: "hdklqkcssgxlvehva")
        test.run()
        return test.result == 4
    }
}
