//
//  HammingDistanceTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 12.11.2020.
//

import Foundation

public class HammingDistanceTestCase: TestCase {
    public var name: String = "Hamming Distance"
    let x: Int
    let y: Int
    var result = 0
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public func run() {
        result = hammingDistance(x, y)
    }
    
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        let z = x ^ y
        return Array(String(z, radix: 2)).filter({ $0 == "1" }).count
    }
    
    public static func test() -> Bool {
        let test = HammingDistanceTestCase(x: 1, y: 4)
        test.run()
        return test.result == 2
    }
}
