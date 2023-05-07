//
//  UniqueNumberOccurrencesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 01.05.2023.
//

import Foundation

public class UniqueNumberOccurrencesTestCase: TestCase {
    public var name: String = "Unique Number of Occurrences"
    let array: [Int]
    var result = false
    
    init(array: [Int]) {
        self.array = array
    }
    
    public func run() {
        result = uniqueOccurrences(array)
    }
    
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var dict = [Int:Int]()
        for n in arr {
            dict[n, default: 0] += 1
        }
        let vals = dict.map { $1 }
        return vals.count == Set(vals).count
    }
    
    public static func test() -> Bool {
        let test = UniqueNumberOccurrencesTestCase(array: [1,2,2,1,1,3])
        test.run()
        return test.result == true
    }
}
