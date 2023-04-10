//
//  CheckSentenceIsPangramTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 09.04.2023.
//

import Foundation

public class CheckSentenceIsPangramTestCase: TestCase {
    public var name: String = "Check if the Sentence Is Pangram"
    let string: String
    var result = false
    
    init(str: String) {
        self.string = str
    }
    
    public func run() {
        result = checkIfPangram(name)
    }
    
    func checkIfPangram(_ sentence: String) -> Bool {
        Set(sentence).count == 26
    }
    
    public static func test() -> Bool {
        let test = CheckSentenceIsPangramTestCase(str: "thequickbrownfoxjumpsoverthelazydog")
        test.run()
        return test.result == true
    }
}
