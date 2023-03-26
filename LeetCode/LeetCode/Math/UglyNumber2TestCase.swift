//
//  UglyNumber2TestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 24.03.2023.
//

import Foundation

public class UglyNumber2TestCase: TestCase {
    public var name: String = "Ugly Number II"
    var n: Int
    var result = 0
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = nthUglyNumber(n)
    }
    
    func nthUglyNumber(_ n: Int) -> Int {
        var arr = Array(repeating: 0, count: n)
        arr[0] = 1
        var x = 0
        var y = 0
        var z = 0
        for i in 1..<n {
            let a = arr[x] * 2
            let b = arr[y] * 3
            let c = arr[z] * 5
            arr[i] = min(a, min(b, c))
            if arr[i] == a { x += 1 }
            if arr[i] == b { y += 1 }
            if arr[i] == c { z += 1 }
        }
        return arr[n - 1]
    }
    
    public static func test() -> Bool {
        let test = UglyNumber2TestCase(n: 10)
        test.run()
        return test.result == 12
    }
}
