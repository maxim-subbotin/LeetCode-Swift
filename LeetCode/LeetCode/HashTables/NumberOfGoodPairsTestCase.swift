//
//  NumberOfGoodPairsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 09.04.2023.
//

import Foundation

public class NumberOfGoodPairsTestCase: TestCase {
    public var name: String = "Number of Good Pairs"
    var array: [Int]
    var result = 0
    
    init(array: [Int]) {
        self.array = array
    }
    
    public func run() {
        result = numIdenticalPairs(array)
    }
    
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for i in nums {
            if dict[i] == nil {
                dict[i] = 1
            } else {
                dict[i]! += 1
            }
        }
        
        func c(n: Int) -> Int {
            n < 2 ? 0 : n * (n - 1) / 2
        }
        
        return dict.keys.reduce(0, { $0 + c(n: dict[$1]!) })
    }
    
    public static func test() -> Bool {
        let test = NumberOfGoodPairsTestCase(array: [1,2,3,1,1,3])
        test.run()
        return test.result == 4
    }
}
