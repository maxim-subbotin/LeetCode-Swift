//
//  TwoOutOfThreeTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 01.05.2023.
//

import Foundation

public class TwoOutOfThreeTestCase: TestCase {
    public var name: String = "Two Out of Three"
    let nums1: [Int]
    let nums2: [Int]
    let nums3: [Int]
    var result = [Int]()
    
    init(nums1: [Int], nums2: [Int], nums3: [Int]) {
        self.nums1 = nums1
        self.nums2 = nums2
        self.nums3 = nums3
    }
    
    public func run() {
        result = twoOutOfThree(nums1, nums2, nums3)
    }
    
    struct Res {
        var c1: Int = 0
        var c2: Int = 0
        var c3: Int = 0
        private var n = 0
        var isValid: Bool {
            check()
        }
        
        func check() -> Bool {
            [c1, c2, c3].filter { $0 > 0 }.count > 1
        }
    }
    
    func twoOutOfThree(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int]) -> [Int] {
        var dict = Array(repeating: Res(), count: 101)
        var keys = Set<Int>()
        for n in nums1 {
            dict[n].c1 += 1
            keys.insert(n)
        }
        for n in nums2 {
            dict[n].c2 += 1
            keys.insert(n)
        }
        for n in nums3 {
            dict[n].c3 += 1
            keys.insert(n)
        }
        var result = [Int]()
        for key in keys {
            if dict[key].isValid {
                result.append(key)
            }
        }
        
        return result
    }
    
    public static func test() -> Bool {
        let test = TwoOutOfThreeTestCase(nums1: [1,1,3,2], nums2: [2,3], nums3: [3])
        test.run()
        return test.result == [2,3]
    }
}
