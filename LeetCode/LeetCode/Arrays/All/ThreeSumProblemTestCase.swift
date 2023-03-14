//
//  ThreeSumProblemTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 27.02.2023.
//

import Foundation

public class ThreeSumProblemTestCase: TestCase {
    public var name = "3Sum"
    var array: [Int]
    var result = [[Int]]()
    
    init(array: [Int]) {
        self.array = array
    }
    
    public func run() {
        result = threeSum(array)
    }
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 { return [[Int]]() }
        var res = [[Int]]()
        var hashes = Set<String>()
        let sum = 0
        let arr = nums.sorted()
        for i in 0..<nums.count - 2 {
            let k = sum - arr[i]
            var low = i + 1
            var high = arr.count - 1
            while low < high {
                let s = arr[low] + arr[high]
                if s < k {
                    low += 1
                } else if s > k {
                    high -= 1
                } else {
                    let hash = "\(arr[i])_\(arr[low])_\(arr[high])"
                    if !hashes.contains(hash) {
                        res.append([arr[i], arr[low], arr[high]])
                        hashes.insert(hash)
                    }
                    low += 1
                    high -= 1
                }
            }
        }
        
        return res
    }
    
    public static func test() -> Bool {
        let array = [-1,0,1,2,-1,-4]
        let test = ThreeSumProblemTestCase(array: array)
        test.run()
        return test.result == [[-1,-1,2],[-1,0,1]]
    }
}
