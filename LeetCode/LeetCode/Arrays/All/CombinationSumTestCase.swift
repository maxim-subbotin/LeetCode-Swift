//
//  CombinationSumTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 26.03.2023.
//

import Foundation

public class CombinationSumTestCase: TestCase {
    public var name: String = "Combination Sum"
    let candidates: [Int]
    let target: Int
    var result = [[Int]]()
    
    init(candidates: [Int], target: Int) {
        self.candidates = candidates
        self.target = target
    }
    
    public func run() {
        result = combinationSum(candidates, target)
    }
    
    func process(arr: [Int], target: Int, res: inout [[Int]], r: inout [Int], i:  Int) {
        if target == 0 {
            res.append(r)
            return
        }
        var i = i
        while i < arr.count && target - arr[i] >= 0 {
            r.append(arr[i])
            process(arr: arr, target: target - arr[i], res: &res, r: &r, i: i)
            _ = r.removeLast()
            i += 1
        }
    }
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let arr = Set(candidates).sorted()
        var res = [[Int]]()
        var r = [Int]()
        var i = 0
        process(arr: arr, target: target, res: &res, r: &r, i: i)
        return res
    }
    
    public static func test() -> Bool {
        let test = CombinationSumTestCase(candidates: [2,3,5], target: 8)
        test.run()
        return test.result == [[2,2,2,2],[2,3,3],[3,5]]
    }
}
