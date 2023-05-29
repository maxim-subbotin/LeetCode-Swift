//
//  ConvertArray2DArrayTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 28.05.2023.
//

import Foundation

public class ConvertArray2DArrayTestCase: TestCase {
    public var name: String = "Convert an Array Into a 2D Array With Conditions"
    let array: [Int]
    var result = [[Int]]()
    
    init(array: [Int]) {
        self.array = array
    }
    
    public func run() {
        result = findMatrix(array)
    }
    
    func findMatrix(_ nums: [Int]) -> [[Int]] {
        var stat = [Int: Int]()
        var res = [Int: [Int]]()
        for i in 0..<nums.count {
            stat[nums[i], default: 0] += 1
            let n = stat[nums[i]]!
            res[n, default: [Int]()].append(nums[i])
        }
        return res.map { $0.value }
    }
    
    public static func test() -> Bool {
        let test = ConvertArray2DArrayTestCase(array: [1,3,4,1,2,3,1])
        test.run()
        return test.result == [[1,3,4,2],[1,3],[1]]
    }
}
