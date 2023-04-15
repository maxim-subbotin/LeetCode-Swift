//
//  FirstLetterAppearTwiceTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 15.04.2023.
//

import Foundation

public class FirstLetterAppearTwiceTestCase: TestCase {
    public var name: String = "First Letter to Appear Twice"
    let string: String
    var result: Character = " "
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = repeatedCharacter(string)
    }
    
    func repeatedCharacter(_ s: String) -> Character {
        let bytes = [UInt8](s.utf8)
        var stat = Array(repeating: 0, count: 256)
        for byte in bytes {
            stat[Int(byte)] += 1
            if stat[Int(byte)] == 2 {
                return Character(UnicodeScalar(byte))
            }
        }
        return " "
    }
    
    public static func test() -> Bool {
        let test = FirstLetterAppearTwiceTestCase(string: "abccbaacz")
        test.run()
        return test.result == "c"
    }
}
