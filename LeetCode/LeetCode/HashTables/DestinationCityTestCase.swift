//
//  DestinationCityTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 12.04.2023.
//

import Foundation

public class DestinationCityTestCase: TestCase {
    public var name: String = "Destination City"
    let paths: [[String]]
    var result = ""
    
    init(paths: [[String]]) {
        self.paths = paths
    }
    
    public func run() {
        result = destCity(paths)
    }
    
    func destCity(_ paths: [[String]]) -> String {
        var from = Set<String>()
        var to = Set<String>()
        for path in paths {
            from.insert(path[0])
            to.insert(path[1])
        }
        return to.subtracting(from).first ?? ""
    }
    
    public static func test() -> Bool {
        let test = DestinationCityTestCase(paths: [["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]])
        test.run()
        return test.result == "Sao Paulo"
    }
}
