//
//  FractionToRecurringDecimalTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 18.03.2023.
//

import Foundation

public class FractionToRecurringDecimalTestCase: TestCase {
    public var name: String = "Fraction to Recurring Decimal"
    var a: Int
    var b: Int
    var result = ""
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
    
    public func run() {
        result = fractionToDecimal(a, b)
    }
    
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        var res = ""
        var total = ""
        if (numerator < 0 && denominator > 0) || (numerator > 0 && denominator < 0) {
            res += "-"
        }
        let d = abs(denominator)
        let n = abs(numerator)
        res += String(n/d)
        var map = [Int: Int]()
        var r = n % d
        if r != 0 {
            res += "."
            while res.count < 1000 {
                if r == 0 || map[r] != nil {
                    break
                }
                map[r] = res.count
                let t = (r * 10) / d
                res += String(t)
                r = (r * 10) % d
            }
            if map[r] != nil {
                let index = res.index(res.startIndex, offsetBy: map[r]!)
                let s1 = res[..<index]
                let s2 = res[index...]
                total = "\(s1)(\(s2))"
            } else {
                total = res
            }
        } else {
            total = res
        }
        
        return total
    }
    
    public static func test() -> Bool {
        let test = FractionToRecurringDecimalTestCase(a: 1, b: 214748364)
        test.run()
        return test.result == "0.00(000000465661289042462740251655654056577585848337359161441621040707904997124914069194026549138227660723878669455195477065427143370461252966751355553982241280310754777158628319049732085502639731402098131932683780538602845887105337854867197032523144157689601770377165713821223802198558308923834223016478952081795603341592860749337303449725)"
    }
}
