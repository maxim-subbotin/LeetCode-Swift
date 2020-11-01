//
//  FirstBadVersionTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 02.11.2020.
//

import Foundation

public class FirstBadVersionTestCase: TestCase {
    public var name: String = "First Bad Version"
    var n: Int
    var bad: Int
    var result = -1
    
    init(withN n: Int, andBad b: Int) {
        self.n = n
        self.bad = b
    }
    
    public func run() {
        result = firstBadVersion(n)
    }
    
    func isBadVersion(_ version: Int) -> Bool{
        return version >= bad
    }
    
    func firstBadVersion(_ n: Int) -> Int {
        if isBadVersion(1) {
            return 1
        }
        var startIndex = 0
        var endIndex = n - 1
        while endIndex > startIndex {
            if endIndex == startIndex + 1 {
                if isBadVersion(startIndex + 1) {
                    return startIndex + 1
                }
                if isBadVersion(endIndex + 1) {
                    return endIndex + 1
                }
            }
            
            let mid = (endIndex + startIndex) / 2
            let res = isBadVersion(mid + 1)
            if res {
                endIndex = mid
            } else {
                startIndex = mid
            }
        }
        return 0
    }
    
    public static func test() -> Bool {
        let test = FirstBadVersionTestCase(withN: 999, andBad: 511)
        test.run()
        return test.result == 4
    }
}
