//
//  GetMaximumGeneratedArrayTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 30.04.2023.
//

import Foundation

public class GetMaximumGeneratedArrayTestCase: TestCase {
    public var name: String = "Get Maximum in Generated Array"
    let n: Int
    var result = 0
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = getMaximumGenerated(n)
    }
    
    func getMaximumGenerated(_ n: Int) -> Int {
        if n == 0 { return 0 }
        var i = 1
        var array = Array(repeating: 0, count: n + 1)
        array[1] = 1
        var m = 1
        var run = true
        while run {
            let j = i * 2
            let j1 = j + 1
            if j <= n {
                array[j] = array[i]
            } else {
                run = false
            }
            if j1 <= n {
                array[j1] = array[i] + array[i + 1]
                m = max(m, array[j1])
            } else {
                run = false
            }
            i += 1
        }
        return m
    }
    
    public static func test() -> Bool {
        let test = GetMaximumGeneratedArrayTestCase(n: 100)
        test.run()
        return test.result == 21
    }
}
