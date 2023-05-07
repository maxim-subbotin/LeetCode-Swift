//
//  CountItemsMatchingRuleTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 03.05.2023.
//

import Foundation

// [type, color, name]
public class CountItemsMatchingRuleTestCase: TestCase {
    public var name: String = "Count Items Matching a Rule"
    let items: [[String]]
    let ruleKey: String
    let ruleValue: String
    var result = 0
    
    init(items: [[String]], ruleKey: String, ruleValue: String) {
        self.items = items
        self.ruleKey = ruleKey
        self.ruleValue = ruleValue
    }
    
    public func run() {
        result = countMatches(items, ruleKey, ruleValue)
    }
    
    func countMatches(_ items: [[String]], _ ruleKey: String, _ ruleValue: String) -> Int {
        var index = 0
        if ruleKey == "color" {
            index = 1
        } else if ruleKey == "name" {
            index = 2
        }
        return items.filter({ $0[index] == ruleValue }).count
    }
    
    public static func test() -> Bool {
        let test = CountItemsMatchingRuleTestCase(items: [["phone","blue","pixel"],["computer","silver","phone"],["phone","gold","iphone"]], ruleKey: "type", ruleValue: "phone")
        test.run()
        return test.result == 2
    }
}
