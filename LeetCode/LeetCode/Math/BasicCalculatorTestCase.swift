//
//  BasicCalculatorTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 20.03.2023.
//

import Foundation

public class BasicCalculatorTestCase: TestCase {
    public var name: String = "Basic Calculator"
    var s: String
    var result: Int = 0
    
    init(s: String) {
        self.s = s
    }
    
    public func run() {
        result = calculate(s)
    }
    
    func calculate(_ s: String) -> Int {
        let node = buildTree(s: s)
        return 0
    }
    
    func buildTree(s: String) -> Node? {
        let buffer = s.map({ $0 })
        let nums: [Character: Int] = [
            "0": 0,
            "1": 1,
            "2": 2,
            "3": 3,
            "4": 4,
            "5": 5,
            "6": 6,
            "7": 7,
            "8": 8,
            "9": 9
        ]
        let operations: [Character: Operation.Operation] = [
            "+": .add,
            "-": .sub
        ]
        var operand = [Int]()
        var leftNode: Node?
        var opNode: Node?
        var rightNode: Node?
        var bracket: String?
        for char in buffer {
            if let d = nums[char] {
                operand.append(d)
            } else {
                if !operand.isEmpty {
                    // save operand
                    let n = Operand(value: 5)
                    operand.removeAll()
                    if leftNode == nil {
                        leftNode = n
                    } else if rightNode == nil {
                        rightNode = n
                        opNode?.right = rightNode
                    }
                }
                if let op = operations[char] {
                    let o = Operation(operation: op)
                    if opNode == nil {
                        opNode = o
                        opNode?.left = leftNode
                    } else {
                        o.left = opNode
                        opNode = o
                    }
                } else if char == "(" {
                    bracket = "("
                } else if char == ")" && bracket == "(" {
                    // close brackets
                }
            }
        }
        return opNode
    }
    
    class Node {
        var left: Node?
        var right: Node?
    }
    
    class Operand: Node {
        var value: Int = 0
        
        init(value: Int) {
            self.value = value
        }
    }
    
    class Operation: Node {
        enum Operation {
            case add
            case sub
        }
        var operation: Operation = .add
        
        init(operation: Operation) {
            self.operation = operation
        }
        
        func result() -> Int {
            if let a = (left as? Operand)?.value,
               let b = (right as? Operand)?.value {
                switch operation {
                case .add: return a + b
                case .sub: return a - b
                }
            }
            if let a = (left as? Operand)?.value, operation == .sub {
                return -a
            }
            return 0
        }
    }
    
    public static func test() -> Bool {
        let test = BasicCalculatorTestCase(s: "(1+(4+5+2)-3)+(6+8)")
        test.run()
        return test.result == 23
    }
}
