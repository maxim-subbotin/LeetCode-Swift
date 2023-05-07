//
//  ReverseWordsInStringIIITestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 05.05.2023.
//

import Foundation

public class ReverseWordsInStringIIITestCase: TestCase {
    public var name: String = "Reverse Words in a String III"
    let string: String
    var result = ""
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = reverseWords(string)
    }
    
    func reverseWords(_ s: String) -> String {
        var items = [[Character]]()
        let chars = Array(s)
        var buffer = [Character]()
        for i in (0..<chars.count).reversed() {
            if chars[i] == " " {
                items.append(buffer)
                buffer.removeAll()
            } else {
                buffer.append(chars[i])
            }
        }
        items.append(buffer)
        var res = [Character]()
        for i in (0..<items.count).reversed() {
            res.append(contentsOf: items[i])
            if i != 0 {
                res.append(" ")
            }
        }
        return String(res)
    }
    
    public static func test() -> Bool {
        let test = ReverseWordsInStringIIITestCase(string: "Let's take LeetCode contest")
        test.run()
        return test.result == "s'teL ekat edoCteeL tsetnoc"
    }
}
