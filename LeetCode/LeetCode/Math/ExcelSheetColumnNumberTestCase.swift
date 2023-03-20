//
//  ExcelSheetColumnNumberTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 19.03.2023.
//

import Foundation

public class ExcelSheetColumnNumberTestCase: TestCase {
    public var name: String = "Excel Sheet Column Number"
    var column: String
    var result = 0
    
    init(column: String) {
        self.column = column
    }
    
    public func run() {
        result = titleToNumber(column)
    }
    
    func titleToNumber(_ columnTitle: String) -> Int {
        // A - Ascii code 65
        let digits: [UInt8] = Array(columnTitle.utf8)
        var sum = 0
        var d = 1
        for i in (0..<digits.count).reversed() {
            sum += Int(digits[i] - 64) * d
            d *= 26
        }
        return sum
    }
    
    public static func test() -> Bool {
        let test = ExcelSheetColumnNumberTestCase(column: "ZY")
        test.run()
        return test.result == 701
    }
}
