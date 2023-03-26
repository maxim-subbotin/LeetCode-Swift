//
//  SuperUglyNumberTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 25.03.2023.
//

import Foundation

public class SuperUglyNumberTestCase: TestCase {
    public var name: String = "Super Ugly Number"
    var n: Int
    var primes: [Int]
    var result = 0
    
    init(n: Int, primes: [Int]) {
        self.n = n
        self.primes = primes
    }
    
    public func run() {
        result = nthSuperUglyNumber(n, primes)
    }
    
    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        var arr = Array(repeating: 0, count: n + 1)
        var indexes = Array(repeating: 0, count: primes.count)
        arr[0] = 1
        for i in 1..<arr.count {
            arr[i] = .max
            for j in 0..<primes.count {
                arr[i] = min(arr[i], arr[indexes[j]] * primes[j])
            }
            for j in 0..<primes.count {
                if arr[i] == arr[indexes[j]] * primes[j] {
                    indexes[j] += 1
                }
            }
        }
        return arr[n - 1]
    }
    
    public static func test() -> Bool {
        let test = SuperUglyNumberTestCase(n: 12, primes: [2,7,13,19])
        test.run()
        return test.result == 32
    }
}
