//
//  SortPeopleTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 11.04.2023.
//

import Foundation

public class SortPeopleTestCase: TestCase {
    public var name: String = "Sort the People"
    let names: [String]
    let heights: [Int]
    var result = [String]()
    
    init(names: [String], heights: [Int]) {
        self.names = names
        self.heights = heights
    }
    
    public func run() {
        result = sortPeople(names, heights)
    }
    
    func sortPeople(_ names: [String], _ heights: [Int]) -> [String] {
        var dict = [Int: String]()
        for i in 0..<names.count {
            dict[heights[i]] = names[i]
        }
        return heights.sorted(by: >).compactMap({ dict[$0] })
    }
    
    public static func test() -> Bool {
        let test = SortPeopleTestCase(names: ["Alice","Bob","Bob"], heights: [155,185,150])
        test.run()
        return test.result == ["Bob","Alice","Bob"]
    }
}
