//
//  AddBinaryTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 18.03.2023.
//

import Foundation

public class AddBinaryTestCase: TestCase {
    public var name: String = "Add Binary"
    var str1: String
    var str2: String
    var result = ""
    
    init(str1: String, str2: String) {
        self.str1 = str1
        self.str2 = str2
    }
    
    public func run() {
        result = addBinary(str1, str2)
    }
    
    func addBinary(_ a: String, _ b: String) -> String {
        var str = [Bool]()
        let a: [Bool] = a.map({ $0 == "1" ? true : false })
        let b: [Bool] = b.map({ $0 == "1" ? true : false })
        var c = 0
        var i = a.count - 1
        var j = b.count - 1
        while i >= 0 || j >= 0 || c == 1 {
            if i >= 0 {
                c += (a[i] || false) ? 1 : 0
            }
            if j >= 0 {
                c += (b[j] || false) ? 1 : 0
            }
            str.append(c % 2 == 1 ? true : false)
            c = c / 2
            i -= 1
            j -= 1
        }
        return str.reversed().map({ $0 ? "1" : "0" }).joined()
    }
    
    public static func test() -> Bool {
        let test = AddBinaryTestCase(str1: "1010", str2: "1011")
        test.run()
        return test.result == "10101"
    }
}
