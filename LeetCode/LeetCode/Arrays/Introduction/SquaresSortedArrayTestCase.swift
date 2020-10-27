//
//  SquaresSortedArrayTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/23/20.
//

import Foundation

public class SquaredSortedArrayTestCase: TestCase {
    public var name: String = "Squares of a Sorted Array"
    var array: [Int]
    var result = [Int]()
    
    public init(withArray arr: [Int]) {
        array = arr
    }
    
    public func run() {
        result = sortedSquares(array)
    }
    
    func sortedSquares(_ A: [Int]) -> [Int] {
        var sortedArray = [Int]()
        for i in 0..<A.count {
            let s = A[i] * A[i]
            if sortedArray.count == 0 {
                sortedArray.append(s)
            } else if s <= sortedArray[0] {
                sortedArray.insert(s, at: 0)
            } else if s >= sortedArray[sortedArray.count - 1] {
                sortedArray.append(s)
            } else {
                var startRange = 0
                var endRange = sortedArray.count - 1
                while endRange - startRange > 1 {
                    let mid = (endRange + startRange) / 2
                    if sortedArray[mid] == s {
                        startRange = mid
                        endRange = mid + 1
                    } else if sortedArray[mid] < s {
                        startRange = mid
                    } else {
                        endRange = mid
                    }
                }
                sortedArray.insert(s, at: endRange)
            }
        }
        return sortedArray
        
        //return A.map({ abs($0) }).sorted().map({ $0 * $0})
        //return A.map({ $0 * $0 }).sorted()
    }
    
    public static func test() -> Bool {
        var ints = [Int]()
        var start = -8000
        for i in 0...4000 {
            start += 3
            ints.append(start)
        }
        print(ints)
        
        let testData = ints // [-34, -23, -4, -5, -5, 0, 23, 56, 6] //[-4,-1,0,3,10] // [0,1,9,16,100]
        let test = SquaredSortedArrayTestCase(withArray: testData)
        test.run()
        
        for i in 0..<(test.result.count - 1) {
            let a = test.result[i]
            let b = test.result[i + 1]
            if b < a {
                return false
            }
        }
        
        return true
    }
}
