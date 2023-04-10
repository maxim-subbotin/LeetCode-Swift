//
//  DecodeTheMessageTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 09.04.2023.
//

import Foundation

public class DecodeTheMessageTestCase: TestCase {
    public var name: String = "Decode the Message"
    let key: String
    let message: String
    var result = ""
    
    init(key: String, message: String) {
        self.key = key
        self.message = message
    }
    
    public func run() {
        result = decodeMessage(key, message)
    }
    
    func decodeMessage(_ key: String, _ message: String) -> String {
        let alph = Array("abcdefghijklmnopqrstuvwxyz")
        let setAlph = Set(alph)
        let ks = Array(key)
        var table = [Character: Character]()
        var set = Set<Character>()
        var i = 0
        var j = 0
        while j < alph.count && i < ks.count {
            if setAlph.contains(ks[i]) && !set.contains(ks[i]) {
                table[ks[i]] = alph[j]
                set.insert(ks[i])
                j += 1
            }
            i += 1
        }
        var answ = [Character]()
        message.forEach {
            answ.append(table[$0] ?? $0)
        }
        return String(answ)
    }
    
    public static func test() -> Bool {
        let test = DecodeTheMessageTestCase(key: "the quick brown fox jumps over the lazy dog", message: "vkbs bs t suepuv")
        test.run()
        return test.result == "this is a secret"
    }
}
