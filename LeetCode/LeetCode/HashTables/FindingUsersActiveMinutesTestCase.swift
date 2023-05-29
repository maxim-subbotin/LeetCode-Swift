//
//  FindingUsersActiveMinutesTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 28.05.2023.
//

import Foundation

public class FindingUsersActiveMinutesTestCase: TestCase {
    public var name: String = "Finding the Users Active Minutes"
    let data: [[Int]]
    let k: Int
    var result = [Int]()
    
    init(data: [[Int]], k: Int) {
        self.data = data
        self.k = k
    }
    
    public func run() {
        result = findingUsersActiveMinutes(data, k)
    }
    
    func findingUsersActiveMinutes(_ logs: [[Int]], _ k: Int) -> [Int] {
        var uam = [Int: Set<Int>]()
        for i in 0..<logs.count {
            uam[logs[i][0], default: Set()].insert(logs[i][1])
        }
        let nums = uam.map { $0.value.count }
        var stat = [Int: Int]()
        for i in 0..<nums.count {
            stat[nums[i], default: 0] += 1
        }
        return (1...k).map { stat[$0, default: 0] }
    }
    
    public static func test() -> Bool {
        let test = FindingUsersActiveMinutesTestCase(data: [[0,5],[1,2],[0,2],[0,5],[1,3]], k: 5)
        test.run()
        return test.result == [0,2,0,0,0]
    }
}
