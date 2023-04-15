//
//  RingsAndRodsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 11.04.2023.
//

import Foundation

public class RingsAndRodsTestCase: TestCase {
    public var name: String = "Rings and Rods"
    let rings: String
    var result = 0
    
    init(rings: String) {
        self.rings = rings
    }
    
    public func run() {
        result = countPoints(rings)
    }
    
    func countPoints(_ rings: String) -> Int {
        if rings.count < 6 {
            return 0
        }
        let rs = Array(rings)
        var dict = [Character: Set<Character>]()
        var i = 0
        var n = 0
        while i < rs.count {
            let color = rs[i]
            let rod = rs[i + 1]
            if dict[rod] == nil {
                dict[rod] = Set([color])
            } else if (dict[rod]?.count ?? 0) < 3 {
                dict[rod]?.insert(color)
                if (dict[rod]?.count ?? 0) == 3 {
                    n += 1
                }
            }
            
            i += 2
        }
        return n
    }
    
    public static func test() -> Bool {
        let test = RingsAndRodsTestCase(rings: "B0B6G0R6R0R6G9")
        test.run()
        return test.result == 1
    }
}
