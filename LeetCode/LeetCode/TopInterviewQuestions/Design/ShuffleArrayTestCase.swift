//
//  ShuffleArrayTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 11.11.2020.
//

import Foundation

public class ShuffleArrayTestCase: TestCase {
    public var name: String = "Shuffle an Array"
    
    public func run() {
        //
    }
    
    class Solution {
        let array: [Int]

        init(_ nums: [Int]) {
            self.array = nums
        }
        
        /** Resets the array to its original configuration and return it. */
        func reset() -> [Int] {
            return array
        }
        
        /** Returns a random shuffling of the array. */
        func shuffle() -> [Int] {
            return array.shuffled()
        }
    }
}
