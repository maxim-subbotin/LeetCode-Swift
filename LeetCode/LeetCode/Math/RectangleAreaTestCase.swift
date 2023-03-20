//
//  RectangleAreaTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 20.03.2023.
//

import Foundation

extension CGRect {
    var ax1: Int { Int(minX) }
    var ay1: Int { Int(minY) }
    var ax2: Int { Int(maxX) }
    var ay2: Int { Int(maxY) }
}

public class RectangleAreaTestCasse: TestCase {
    public var name: String = "Rectangle Area"
    var rect1: CGRect
    var rect2: CGRect
    var result: Int = 0
    
    init(rect1: CGRect, rect2: CGRect) {
        self.rect1 = rect1
        self.rect2 = rect2
    }
    
    public func run() {
        result = computeArea(
            rect1.ax1, rect1.ay1, rect1.ax2, rect1.ay2,
            rect2.ax1, rect2.ay1, rect2.ax2, rect2.ay2
        )
    }
    
    func computeArea(_ ax1: Int, _ ay1: Int, _ ax2: Int, _ ay2: Int, _ bx1: Int, _ by1: Int, _ bx2: Int, _ by2: Int) -> Int {
            (ax2 - ax1) * (ay2 - ay1) + (bx2 - bx1) * (by2 - by1) - intersection(ax1: ax1, ay1, ax2, ay2, bx1, by1, bx2, by2)
        }
    
    func intersection(ax1: Int, _ ay1: Int, _ ax2: Int, _ ay2: Int, _ bx1: Int, _ by1: Int, _ bx2: Int, _ by2: Int) -> Int {
        let x = max(ax1, bx1)
        let num1 = min(ax2, bx2)
        let y = max(ay1, by1)
        let num2 = min(ay2, by2)
        if num1 >= x && num2 >= y {
            return (num1 - x) * (num2 - y)
        } else {
            return 0
        }
    }
    
    public static func test() -> Bool {
        let test = RectangleAreaTestCasse(rect1: CGRect(x: -3, y: 0, width: 6, height: 4), rect2: CGRect(x: 0, y: -1, width: 9, height: 3))
        test.run()
        return test.result == 45
    }
}
