//
//  XOfKindInDeckOfCardsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 07.05.2023.
//

import Foundation

public class XOfKindInDeckOfCardsTestCase: TestCase {
    public var name: String = "X of a Kind in a Deck of Cards"
    let deck: [Int]
    var result = false
    
    init(deck: [Int]) {
        self.deck = deck
    }
    
    public func run() {
        result = hasGroupsSizeX(deck)
    }
    
    func hasGroupsSizeX(_ deck: [Int]) -> Bool {
        if deck.count == 1 {
            return false
        }
        var stat = [Int: Int]()
        for i in 0..<deck.count {
            stat[deck[i], default: 0] += 1
        }
        var f = stat.values.first!
        let set = Set(stat.values)
        for i in set {
            f = gcd(max(f, i), min(f, i))
        }
        return f > 1
    }
    
    func gcd(_ m: Int, _ n: Int) -> Int {
        var a: Int = 0
        var b: Int = max(m, n)
        var r: Int = min(m, n)

        while r != 0 {
            a = b
            b = r
            r = a % b
        }
        return b
    }
    
    public static func test() -> Bool {
        let test = XOfKindInDeckOfCardsTestCase(deck: [1,1,2,2,2,2])
        test.run()
        return test.result == true
    }
}
