//
//  SqrtTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 18.03.2023.
//

import Foundation

public class SqrtTestCase: TestCase {
    public var name: String = "Sqrt(x)"
    private var n: Int
    public var result: Int = 0
    
    public init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = mySqrt(n)
    }
    
    func mySqrt(_ x: Int) -> Int {
        let str = String(x)
        let ln = str.count
        var n: Int = 0
        if ln > 1, let f = str.first, let start = Int("\(f)") {
            let deg = (ln - 1) / 2
            let d = Int(pow(10.0, Double(deg)))
            n = s(start) * d
        } else {
            n = s(x)
        }
        var x1 = Double(n)
        var prevInt = 0
        let d = Double(x)
        while prevInt != Int(x1) {
            prevInt = Int(x1)
            x1 = 0.5 * (x1 + d / x1)
        }
        return Int(x1)
    }
    
    func s(_ n: Int) -> Int {
        switch n {
        case 1, 2, 3:
            return 1
        case 4, 5, 6, 7, 8:
            return 2
        case 9:
            return 3
        default:
            return 0
        }
    }
    
    public static func test() -> Bool {
        let test = SqrtTestCase(n: 12345)
        test.run()
        return test.result == 111
    }
}
