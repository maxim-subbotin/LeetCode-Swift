//
//  MinStackTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 11.11.2020.
//

import Foundation

public class MinStackTestCase: TestCase {
    enum CommandType: String {
        case minStack = "MinStack"
        case push = "push"
        case pop = "pop"
        case top = "top"
        case getMin = "getMin"
    }
    struct Command {
        var type: CommandType
        var param: Int?
    }
    
    public var name: String = "Min Stack"
    var commands: [Command]
    var result = [Int?]()
    
    init(withCommands cmds: [Command]) {
        self.commands = cmds
    }
    
    public func run() {
        let stack = MinStack()
        for cmd in commands {
            if cmd.type == .minStack {
                result.append(nil)
            }
            if cmd.type == .push {
                stack.push(cmd.param!)
                result.append(nil)
            }
            if cmd.type == .pop {
                stack.pop()
                result.append(nil)
            }
            if cmd.type == .top {
                let t = stack.top()
                result.append(t)
            }
            if cmd.type == .getMin {
                let m = stack.getMin()
                result.append(m)
            }
        }
    }
    
    class MinStack {
        var stack: [Int]
        var min = Int.max

        /** initialize your data structure here. */
        init() {
            stack = [Int]()
        }
        
        func push(_ x: Int) {
            stack.append(x)
            if x < min {
                min = x
            }
        }
        
        func pop() {
            if stack.count > 0 {
                let last = stack.last!
                stack.removeLast()
                if last == min {
                    if stack.count > 0 {
                        min = stack.min()!
                    } else {
                        min = Int.max
                    }
                }
            }
        }
        
        func top() -> Int {
            return stack.last ?? 0
        }
        
        func getMin() -> Int {
            return min
        }
    }
    
    public static func test() -> Bool {
        let c = ["MinStack",
                 "push","push","push","top","pop","getMin","pop","getMin","pop","push","top","getMin","push","top","getMin","pop","getMin"]
        let p = [[],[2147483646],[2147483646],[2147483647],[],[],[],[],[],[],[2147483647],[],[],[-2147483648],[],[],[],[]]
        var cmds = [Command]()
        for i in 0..<c.count {
            let t = CommandType(rawValue: c[i]) ?? .minStack
            let param = p[i].count > 0 ? p[i][0] : nil
            cmds.append(Command(type: t, param: param))
        }
        /*let commands = [Command(type: .minStack, param: nil),
                        Command(type: .push, param: -2),
                        Command(type: .push, param: 0),
                        Command(type: .push, param: -3),
                        Command(type: .getMin, param: nil),
                        Command(type: .pop, param: nil),
                        Command(type: .top, param: nil),
                        Command(type: .getMin, param: nil)]*/
        let test = MinStackTestCase(withCommands: cmds)
        test.run()
        return test.result == [nil,nil,nil,nil,-3,nil,0,-2]
    }
}
