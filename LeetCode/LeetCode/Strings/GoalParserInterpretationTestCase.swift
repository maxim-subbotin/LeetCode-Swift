//
//  GoalParserInterpretationTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 02.05.2023.
//

import Foundation

public class GoalParserInterpretationTestCase: TestCase {
    public var name: String = "Goal Parser Interpretation"
    let string: String
    var result = ""
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = interpret(string)
    }
    
    func interpret(_ command: String) -> String {
        var chars = Array(command)
        var res = [Character]()
        var prevChar: Character?
        for char in chars {
            if char == ")" && prevChar == "(" {
                res.append("o")
            } else if char != "(" && char != ")" {
                res.append(char)
            }
            prevChar = char
        }
        return String(res)
    }
    
    public static func test() -> Bool {
        let test = GoalParserInterpretationTestCase(string: "(al)G(al)()()G")
        test.run()
        return test.result == "alGalooG"
    }
}
