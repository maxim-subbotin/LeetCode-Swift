//
//  GroupAnagramsTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 30.03.2023.
//

import Foundation

public class GroupAnagramsTestCase: TestCase {
    public var name: String = "Group Anagrams"
    let strings: [String]
    var result = [[String]]()
    
    init(strings: [String]) {
        self.strings = strings
    }
    
    public func run() {
        result = groupAnagrams(strings)
    }
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var res = [String: [String]]()
        for str in strs {
            let s = String(str.sorted())
            if res[s] == nil {
                res[s] = [str]
            } else {
                res[s]?.append(str)
            }
        }
        
        return res.map({ k, v in
            v
        })
    }
    
    public static func test() -> Bool {
        let test = GroupAnagramsTestCase(strings: ["eat","tea","tan","ate","nat","bat"])
        test.run()
        return test.result == [["bat"],["nat","tan"],["ate","eat","tea"]]
    }
}
