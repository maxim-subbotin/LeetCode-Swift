//
//  PowerOfFourTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 26.03.2023.
//

import Foundation

public class PowerOfFourTestCase: TestCase {
    public var name: String = "Power of Four"
    let n: Int
    var result = false
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = isPowerOfFour(n)
    }
    
    func isPowerOfFour(_ n: Int) -> Bool {
        n.trailingZeroBitCount + 1 + n.leadingZeroBitCount == n.bitWidth && n.trailingZeroBitCount % 2 == 0
    }
    
    public static func test() -> Bool {
        let test = PowerOfFourTestCase(n: 16)
        test.run()
        return test.result == true
    }
}
