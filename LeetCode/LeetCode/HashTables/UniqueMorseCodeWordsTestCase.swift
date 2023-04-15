//
//  UniqueMorseCodeWordsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 10.04.2023.
//

import Foundation

public class UniqueMorseCodeWordsTestCase: TestCase {
    public var name: String = "Unique Morse Code Words"
    let strings: [String]
    var result = 0
    
    init(strings: [String]) {
        self.strings = strings
    }
    
    public func run() {
        result = uniqueMorseRepresentations(strings)
    }
    
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let morses = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        var set = Set<String>()
        for i in 0..<words.count {
            let bytes = [UInt8](words[i].utf8)
            let str = bytes.map({ morses[Int($0) - 97] }).joined()
            set.insert(str)
        }
        return set.count
    }
    
    public static func test() -> Bool {
        let test = UniqueMorseCodeWordsTestCase(strings: ["gin","zen","gig","msg"])
        test.run()
        return test.result == 2
    }
}
