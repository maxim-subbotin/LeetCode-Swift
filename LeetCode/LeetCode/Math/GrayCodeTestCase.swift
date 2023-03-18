//
//  GrayCodeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 18.03.2023.
//

import Foundation

public class GrayCodeTestCase: TestCase {
    public var name: String = "Gray Code"
    var n: Int
    var result = [Int]()
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = grayCode(n)
    }
    
    func grayCode(_ n: Int) -> [Int] {
        let e = 1 << n
        var res = Array(repeating: 0, count: e)
        var l = 1
        var j = 1
        while j != e {
            l = j
            for i in (0..<l).reversed() {
                res[j] = res[i] | l
                j += 1
            }
        }
        return res
    }
    
    public static func test() -> Bool {
        let test = GrayCodeTestCase(n: 2)
        test.run()
        return test.result == [0, 1, 3, 2]
    }
}
