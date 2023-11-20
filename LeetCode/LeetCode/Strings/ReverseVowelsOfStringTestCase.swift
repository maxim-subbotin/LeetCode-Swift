//
//  ReverseVowelsOfStringTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 12.11.2023.
//

import Foundation

public class ReverseVowelsOfStringTestCase: TestCase {
    public var name: String = "Reverse Vowels of a String"
    var result = ""
    var s: String
    
    init(s: String) {
        self.s = s
    }
    
    public func run() {
        result = reverseVowels(s)
    }
    
    func reverseVowels(_ s: String) -> String {
        let vs: [Character] = ["a", "e", "i", "o", "u"]
        let vowels = Set(vs)
        var array = Array(s)
        var indexes = [Int]()
        for i in 0..<array.count where vowels.contains(array[i]) {
            indexes.append(i)
        }
        for i in 0..<(indexes.count / 2) {
            var a = array[indexes[i]]
            array[indexes[i]] = array[indexes[indexes.count - i - 1]]
            array[indexes[indexes.count - i - 1]] = a
        }
        return String(array)
    }
    
    public static func test() -> Bool {
        let test = ReverseVowelsOfStringTestCase(s: "leetcode")
        test.run()
        return test.result == "leotcede"
    }
}
