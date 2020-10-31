//
//  CountAndSayTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 31.10.2020.
//

import Foundation

public class CountAndSayTestCase: TestCase {
    public var name: String = "Count and Say"
    var val: Int
    var result = ""
    
    init(withInt v: Int) {
        self.val = v
    }
    
    public func run() {
        result = countAndSay(val)
    }
    
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        
        var chars:[Character] = ["1"]
        for _ in 2...n {
            chars = transform(chars: chars)
        }
        
        return String(chars)
    }
    
    func transform(chars: [Character]) -> [Character] {
        var index = 1
        var currentChar = chars[0]
        var queueLength = 1
        var results = [(Int,Character)]()
        while index < chars.count {
            if chars[index] == currentChar {
                queueLength += 1
            } else {
                results.append((queueLength, currentChar))
                currentChar = chars[index]
                queueLength = 1
            }
            
            index += 1
        }
        results.append((queueLength, currentChar))
        
        return Array(results.map({ "\($0.0)\($0.1)"}).joined())
    }
    
    public static func test() -> Bool {
        let test = CountAndSayTestCase(withInt: 8)
        test.run()
        return test.result == "1"
    }
}
