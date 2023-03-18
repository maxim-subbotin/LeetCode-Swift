//
//  ExcelSheetColumnTitleTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 18.03.2023.
//

import Foundation

public class ExcelSheetColumnTitleTestCase: TestCase {
    public var name: String = "Excel Sheet Column Title"
    var n: Int
    var result = ""
    
    init(n: Int) {
        self.n = n
    }
    
    public func run() {
        result = convertToTitle(n)
    }
    
    func convertToTitle(_ columnNumber: Int) -> String {
        let chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map({ $0 })
        var i = columnNumber
        var res = [Character]()
        while i > 0 {
            var n = i % chars.count
            if n == 0 {
                n = chars.count
            }
            res.insert(chars[n - 1], at: 0)
            i = (i - n) / chars.count
        }
        return String(res)
    }
    
    public static func test() -> Bool {
        let test = ExcelSheetColumnTitleTestCase(n: 701)
        test.run()
        return test.result == "ZY"
    }
}
