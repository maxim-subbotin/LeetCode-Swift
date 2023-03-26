//
//  NimGameTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 25.03.2023.
//

import Foundation

public class NimGameTestCase: TestCase {
    public var name: String = "Nim Game"
    let n: Int
    var result = false
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = canWinNim(n)
    }
    
    func canWinNim(_ n: Int) -> Bool {
        n % 4 != 0
    }
    
    public static func test() -> Bool {
        let test = NimGameTestCase(n: 4)
        test.run()
        return test.result == false
    }
}
