//
//  EvaluateReversePolishNotationTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 18.03.2023.
//

import Foundation

public class EvaluateReversePolishNotationTestCase: TestCase {
    public var name: String = "Evaluate Reverse Polish Notation"
    var tokens: [String]
    var result = 0
    
    init(tokens: [String]) {
        self.tokens = tokens
    }
    
    public func run() {
        result = evalRPN(tokens)
    }

    func evalRPN(_ tokens: [String]) -> Int {
        let tokens = tokens.compactMap({ Token.from(token:$0) })
        var stack = [Token]()
        for i in (0..<tokens.count).reversed() {
            stack.insert(tokens[i], at: 0)
            var needToCalc = true
            while needToCalc {
                if stack.count > 2 {
                    if let a = stack[0] as? IntToken, let b = stack[1] as? IntToken, let op = stack[2] as? OperationToken {
                        let v = op.exec(a: a.value, b: b.value)
                        stack.removeFirst(3)
                        stack.insert(IntToken(val: v), at: 0)
                    } else {
                        needToCalc = false
                    }
                } else {
                    needToCalc = false
                }
            }
        }
        
        return (stack.first as? IntToken)?.value ?? 0
    }
    
    class Token {
        init?(token: String) {
            
        }
        
        static func from(token: String) -> Token? {
            if let intToken = IntToken(token: token) {
                return intToken
            } else if let opToken = OperationToken(token: token) {
                return opToken
            }
            return nil
        }
    }
    
    class IntToken: Token {
        var value: Int
        
        override init?(token: String) {
            if let v = Int(token) {
                value = v
            } else {
                return nil
            }
            super.init(token: token)
        }
        
        init(val: Int) {
            value = val
            super.init(token: "")!
        }
    }
    
    class OperationToken: Token {
        enum Operation: String {
            case add = "+"
            case sub = "-"
            case mul = "*"
            case div = "/"
        }
        
        var operation: Operation
        
        override init?(token: String) {
            if let o = Operation(rawValue: token) {
                operation = o
            } else {
                return nil
            }
            super.init(token: token)
        }
        
        func exec(a: Int, b: Int) -> Int {
            switch operation {
            case .add: return a + b
            case .sub: return a - b
            case .mul: return a * b
            case .div: return a / b
            }
        }
    }
    
    public static func test() -> Bool {
        let test = EvaluateReversePolishNotationTestCase(tokens: ["10","6","9","3","+","-11","*","/","*","17","+","5","+"])
        test.run()
        return test.result == 22
    }
}
