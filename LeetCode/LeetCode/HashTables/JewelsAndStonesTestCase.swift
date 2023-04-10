//
//  JewelsAndStonesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 09.04.2023.
//

import Foundation

public class JewelsAndStonesTestCase: TestCase {
    public var name: String = "Jewels and Stones"
    let jewels: String
    let stones: String
    var result = 0
    
    init(jewels: String, stones: String) {
        self.jewels = jewels
        self.stones = stones
    }
    
    public func run() {
        result = numJewelsInStones(jewels, stones)
    }
    
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        let jwl = Set(jewels)
        return stones.reduce(0, { $0 + (jewels.contains($1) ? 1 : 0) })
    }
    
    public static func test() -> Bool {
        let test = JewelsAndStonesTestCase(jewels: "aA", stones: "aAAbbbb")
        test.run()
        return test.result == 3
    }
}
