//
//  CountPrimesTestCase.swift
//  LeetCode
//
//  Created by Snappii on 11/3/20.
//

import Foundation

public class CountPrimesTestCase: TestCase {
    public var name: String = "Count Primes"
    var n: Int
    var result = 0
    
    init(withN n: Int) {
        self.n = n
    }
    
    public func run() {
        result = countPrimes(n)
    }
    
    func countPrimes(_ n: Int) -> Int {
        if n <= 2 {
            return 0
        }
        if n == 3 {
            return 1
        }
        
        var primes = [2]
        var currentVal = 3
        while currentVal < n {
            if isPrime(currentVal) {
                primes.append(currentVal)
            }
            currentVal += 2
        }
        
        return primes.count
    }
    
    func isPrime(_ n: Int) -> Bool {
        if n <= 1 {
            return false
        } else if n == 2 {
            return true
        } else if n % 2 == 0 {
            return false
        }
        
        var i = 3
        let max = Int(ceil(sqrt(Double(n))))
        while i <= max {
            if n % i == 0 {
                return false
            }
            i += 2
        }
        
        return true
    }
    
    public static func test() -> Bool {
        let test = CountPrimesTestCase(withN: 1000)
        test.run()
        return test.result == 4
    }
}
