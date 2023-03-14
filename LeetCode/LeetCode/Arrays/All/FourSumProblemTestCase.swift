//
//  FourSumProblemTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 28.02.2023.
//

import Foundation

public class FourSumProblemTestCase: TestCase {
    public var name = "4Sum"
    var array: [Int]
    var result = [[Int]]()
    var target: Int
    
    init(array: [Int], targer: Int) {
        self.array = array
        self.target = targer
    }
    
    public func run() {
        result = fourSum(array, target)
    }
    
    struct Pair {
        var x: Int
        var y: Int
    }
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 { return [] }
        let sourceSet = Set<Int>(nums)
        if sourceSet.count == 1, let n = sourceSet.first, n * 4 == target {
            return [[n, n, n, n]]
        }
        
        var map = [Int: [Pair]]()
        var set = Set<[Int]>()
        for i in 0..<(nums.count - 1) {
            for j in (i + 1)..<nums.count {
                let s = nums[i] + nums[j]
                let val = target - s
                if map[val] != nil {
                    for pair in map[val]! {
                        let x = pair.x
                        let y = pair.y
                        if ((x != i && x != j) && (y != i && y != j)) {
                            let array = [nums[i], nums[j], nums[x], nums[y]].sorted()
                            set.insert(array)
                        }
                    }
                }
                
                if map[s] == nil {
                    map[s] = [Pair]()
                }
                map[s]?.append(Pair(x: i, y: j))
            }
        }
        return Array(set)
    }
    
    public static func test() -> Bool {
        let array = [1,0,-1,0,-2,2]
        let test = FourSumProblemTestCase(array: array, targer: 0)
        test.run()
        return test.result == [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
    }
}
