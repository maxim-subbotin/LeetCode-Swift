//
//  TestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 10/23/20.
//

import Foundation

@objc public protocol TestCase {
    var name: String { get }
    
    @objc optional func prepare()
    
    func run()
    
    @objc optional func output()
    
    @objc optional static func test() -> Bool
}
