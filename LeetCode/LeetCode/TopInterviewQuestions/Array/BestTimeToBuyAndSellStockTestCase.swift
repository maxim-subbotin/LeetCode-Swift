//
//  BestTimeToBuyAndSellStockTestCase.swift
//  LeetCode
//
//  Created by Max Subbotin on 10/27/20.
//

import Foundation

public class BestTimeToBuyAndSellStockTestCase: TestCase {
    public var name: String = "Best Time to Buy and Sell Stock II"
    var array: [Int]
    var result = 0
    
    init(withArray arr: [Int]) {
        self.array = arr
    }
    
    public func run() {
        result = maxProfit(array)
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        var minVal = prices[0]
        var maxVal = prices[0]
        var sum = 0
        for i in 1..<prices.count {
            if prices[i] < maxVal {
                if minVal != maxVal {
                    sum += (maxVal - minVal)
                }
                minVal = prices[i]
                maxVal = prices[i]
            } else {
                maxVal = prices[i]
            }
        }
        if maxVal != minVal {
            sum += (maxVal - minVal)
        }
        
        return sum
    }
    
    public static func test() -> Bool {
        let testData = [7,1,5,3,6,4]
        let test = BestTimeToBuyAndSellStockTestCase(withArray: testData)
        test.run()
        return test.result == 7
    }
}
