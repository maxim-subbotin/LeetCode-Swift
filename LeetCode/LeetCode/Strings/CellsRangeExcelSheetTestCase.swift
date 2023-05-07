//
//  Cells RangeExcelSheetTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 03.05.2023.
//

import Foundation

public class CellsRangeExcelSheetTestCase: TestCase {
    public var name: String = "Cells in a Range on an Excel Sheet"
    let string: String
    var result = [String]()
    
    init(string: String) {
        self.string = string
    }
    
    public func run() {
        result = cellsInRange(string)
    }
    
    func cellsInRange(_ s: String) -> [String] {
        let chars = Array(s)
        let x = UInt8(chars[0].unicodeScalars.first!.value)
        let y = UInt8(chars[1].unicodeScalars.first!.value)
        let x1 = UInt8(chars[3].unicodeScalars.first!.value)
        let y1 = UInt8(chars[4].unicodeScalars.first!.value)
        var bytes = [[UInt8]]()
        for i in x...x1 {
            for j in y...y1 {
                bytes.append([i, j])
            }
        }
        return bytes.compactMap { String(bytes: $0, encoding: .ascii) }
    }
    
    public static func test() -> Bool {
        let test = CellsRangeExcelSheetTestCase(string: "K1:L2")
        test.run()
        return test.result == ["K1","K2","L1","L2"]
    }
}
