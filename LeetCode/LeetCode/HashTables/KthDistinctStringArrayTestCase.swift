//
//  KthDistinctStringArrayTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 17.05.2023.
//

import Foundation

public class KthDistinctStringArrayTestCase: TestCase {
    public var name: String = "Kth Distinct String in an Array"
    let array: [String]
    let k: Int
    var result = ""
    
    init(array: [String], k: Int) {
        self.array = array
        self.k = k
    }
    
    public func run() {
        result = kthDistinct(array, k)
    }
    
    struct Item {
        var number: Int
        var count: Int
        var string: String
    }
    
    func kthDistinct(_ arr: [String], _ k: Int) -> String {
        var res = [String: Item]()
        for i in 0..<arr.count {
            res[arr[i], default: Item(number: i, count: 0, string: arr[i])].count += 1
        }
        var sorted = res.compactMap { $1.count == 1 ? $1 : nil }.sorted {
            $0.number < $1.number
        }
        if k <= sorted.count {
            return sorted[k - 1].string
        }
        return ""
    }
    
    public static func test() -> Bool {
        let test = KthDistinctStringArrayTestCase(array: ["d","b","c","b","c","a","a","b","b","b","c"], k: 3)
        test.run()
        return test.result == ""
    }
}
