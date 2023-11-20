//
//  MinimumOperationsCollectElementsTestCase .swift
//  LeetCode
//
//  Created by Maxim Subbotin on 09.10.2023.
//

import Foundation

public class MinimumOperationsCollectElementsTestCase: TestCase {
    public var name: String = "Minimum Operations to Collect Elements"
    let nums: [Int]
    let k: Int
    var result = 0
    
    init(nums: [Int], k: Int) {
        self.nums = nums
        self.k = k
    }
    
    public func run() {
        result = minOperations(nums, k)
    }
    
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var collection = Set<Int>()
        var example = Set<Int>(1...k)
        var i = 0
        for n in (0..<nums.count).reversed() {
            i += 1
            collection.insert(nums[n])
            if example.isSubset(of: collection) {
                return i
            }
        }
        return i
    }
    
    public static func test() -> Bool {
        let test = MinimumOperationsCollectElementsTestCase(nums: [3,1,5,4,2], k: 2)
        test.run()
        return test.result == 4
    }
}
