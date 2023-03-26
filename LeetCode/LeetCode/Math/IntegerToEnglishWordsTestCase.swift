//
//  IntegerToEnglishWordsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 24.03.2023.
//

import Foundation

public class IntegerToEnglishWordsTestCase: TestCase {
    public var name: String = "Integer to English Words"
    var n: Int
    var result = ""
    let digits = [
        "",
        "One",
        "Two",
        "Three",
        "Four",
        "Five",
        "Six",
        "Seven",
        "Eight",
        "Nine",
        "Ten",
        "Eleven",
        "Twelve",
        "Thirteen",
        "Fourteen",
        "Fifteen",
        "Sixteen",
        "Seventeen",
        "Eighteen",
        "Nineteen"
    ]
    let decs = [
        "",
        "Ten",
        "Twenty",
        "Thirty",
        "Forty",
        "Fifty",
        "Sixty",
        "Seventy",
        "Eighty",
        "Ninety"
    ]
    let degs = [
        "",
        "Thousand",
        "Million",
        "Billion"
    ]
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = numberToWords(n)
    }
    
    func numberToWords(_ num: Int) -> String {
        if num < 20 {
            return digits[num]
        }
        var i = 0
        var sum = ""
        var n = num
        while n > 0 {
            if n % 1000 != 0 {
                sum = string(from: n % 1000) + " " + degs[i] + " " + sum
            }
            n = n / 1000
            i += 1
        }
        return sum.trimmingCharacters(in: .whitespaces)
    }
    
    func string(from n: Int) -> String {
        if n == 0 {
            return ""
        } else if n < 20 {
            return digits[n]
        } else if n < 100 {
            return decs[n / 10] + " " + string(from: n % 10)
        } else {
            return digits[n / 100] + " Hundred " + string(from: n % 100)
        }
    }

    public static func test() -> Bool {
        let test = IntegerToEnglishWordsTestCase(n: 50868)
        test.run()
        return test.result == "Fifty Thousand Eight Hundred Sixty Eight"
    }
}
