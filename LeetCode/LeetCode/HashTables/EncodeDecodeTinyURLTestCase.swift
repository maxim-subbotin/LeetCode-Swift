//
//  EncodeDecodeTinyURLTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 28.05.2023.
//

import Foundation

public class EncodeDecodeTinyURLTestCase {
    public var name: String = "Encode and Decode TinyURL"

    class Codec {
        private var map = [String: String]()
        private var invMap = [String: String]()
        
        // Encodes a URL to a shortened URL.
        func encode(_ longUrl: String) -> String {
            if let code = invMap[longUrl] {
                return "http://tinyurl.com/\(code)"
            }
            let val = randomString(6)
            map[val] = longUrl
            invMap[longUrl] = val
            return "http://tinyurl.com/\(val)"
        }
        
        // Decodes a shortened URL to its original URL.
        func decode(_ shortUrl: String) -> String {
            let code = shortUrl.replacingOccurrences(of: "http://tinyurl.com/", with: "")
            if let url = map[code] {
                return url
            }
            return ""
        }
        
        func randomString(_ length: Int) -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
            return String((0..<length).map{ _ in letters.randomElement()! })
        }
    }
    
    func run() -> Bool {
        let codec = Codec()
        let url1 = "http://google.com"
        let url2 = "http://telegram.me"
        let url3 = "http://maps.me"
        let code1 = codec.encode(url1)
        let code2 = codec.encode(url2)
        let code3 = codec.encode(url3)
        let u1 = codec.decode(code1)
        let u2 = codec.decode(code2)
        let u3 = codec.decode(code3)
        return url1 == u1 && url2 == u2 && url3 == u3
    }
    
    public static func test() -> Bool {
        let test = EncodeDecodeTinyURLTestCase()
        test.run()
        return true
    }
}
