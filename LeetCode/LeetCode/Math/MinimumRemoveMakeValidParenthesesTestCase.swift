//
//  MinimumRemoveMakeValidParenthesesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 17.10.2023.
//

import Foundation

public class MinimumRemoveMakeValidParenthesesTestCase: TestCase {
    public var name: String = "Minimum Remove to Make Valid Parentheses"
    var result = ""
    var s: String
    
    init(s: String) {
        self.s = s
    }
    
    public func run() {
        result = minRemoveToMakeValid(s)
    }
    
    struct Parenthes {
        var char: Character
        var index: Int
    }
    
    func minRemoveToMakeValid(_ s: String) -> String {
        let array = Array(s)
        var ps = [Parenthes]()
        for i in 0..<array.count {
            if array[i] == "(" {
                ps.append(Parenthes(char: array[i], index: i))
            } else if array[i] == ")" {
                if let last = ps.last {
                    if last.char != "(" {
                        ps.append(Parenthes(char: array[i], index: i))
                    } else if last.char == "(" {
                        _ = ps.removeLast()
                    }
                } else {
                    ps.append(Parenthes(char: array[i], index: i))
                }
            }
        }
        if ps.count == 0 {
            return s
        }
        let indexes = ps.map { $0.index }
        /*var k = 0
        for index in indexes {
            array.remove(at: index - k)
            k += 1
        }*/
        var result = [Character]()
        var k = 0
        for i in 0..<array.count {
            if k >= indexes.count || i != indexes[k] {
                result.append(array[i])
            } else {
                k += 1
            }
        }
        return String(result)
    }
    
    public static func test() -> Bool {
        let cases = [("a)b(c)d","ab(c)d"), ("lee(t(c)o)de)", "lee(t(c)o)de"), ("(())", "(())"), ("))((", "")]
        var result = true
        for c in cases {
            let test = MinimumRemoveMakeValidParenthesesTestCase(s: c.0)
            test.run()
            result = result && (test.result == c.1)
        }
        return result
    }
}
