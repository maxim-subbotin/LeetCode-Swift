//
//  BestTimeToBuyAndSellStockTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 16.11.2020.
//

import Foundation

public class BestTimeBuyAndSellStockTestCase: TestCase {
    public var name: String = "Best Time to Buy and Sell Stock"
    let prices: [Int]
    var result = 0
    
    init(withPrices p: [Int]) {
        self.prices = p
    }
    
    public func run() {
        result = maxProfit(prices)
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count <= 1 {
            return 0
        }
        var maximum = prices[0]
        var minimin = prices[0]
        var diff = maximum - minimin
        for i in 1..<prices.count {
            if prices[i] < minimin {
                minimin = prices[i]
                maximum = 0
            } else {
                maximum = max(maximum, prices[i])
            }
            diff = max(diff, maximum - minimin)
        }
        
        return max(0, diff)
    }
    
    public static func test() -> Bool {
        let test = BestTimeBuyAndSellStockTestCase(withPrices: [7,1,5,3,6,4])
        test.run()
        return test.result == 5
    }
}
