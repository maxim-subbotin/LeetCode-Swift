//
//  ClimbingStairsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 16.11.2020.
//

import Foundation

public class ClimbingStairsTestCase: TestCase {
    public var name: String = "Climbing Stairs"
    let n: Int
    var result = 0
    
    init(withN n: Int) {
        self.n = n
    }
    
    public func run() {
        result = climbStairs(n)
    }
    
    func climbStairs(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        var array = [1,2]
        for i in 2..<n {
            array.append(array[i - 2] + array[i - 1])
        }
        return array.last ?? 0
    }
    
    public static func test() -> Bool {
        let test = ClimbingStairsTestCase(withN: 6)
        test.run()
        return test.result == 5
    }
}
