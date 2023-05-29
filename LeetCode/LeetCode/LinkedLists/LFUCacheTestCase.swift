//
//  LFUCacheTestCase.swift
//  LeetCode
//
//  Created by Maxim Subbotin on 14.05.2023.
//

import Foundation

public class LFUCacheTestCase: TestCase {
    public var name: String = "LFU Cache"
    var result = 0
    
    public func run() {
        result = 0
    }
    
    public static func test() -> Bool {
        /*let test = <#Test case#>
        test.run()
        return test.result == <#Test result#>*/
        let cache = LFUCache(2)
        cache.put(2, 1)
        cache.put(1, 2)
        cache.put(2, 3)
        cache.put(4, 1)
        _ = cache.get(1)
        _ = cache.get(2)
        return true
    }
}

class LFUCache {
    struct CacheItem {
        var key: Int
        var value: Int
        var freq: Int
    }
    struct StatItem {
        var keys: [Int]
        var order: Int
    }
    var storage = [Int: CacheItem]()
    var stat = [Int: StatItem]()
    
    private var capacity: Int

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if storage[key] != nil {
            removeFromStat(freq: storage[key]!.freq, key: key)
            storage[key]!.freq += 1
            add(freq: storage[key]!.freq, key: key)
            return storage[key]!.value
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        guard capacity != 0 else { return }
        if storage[key] != nil {
            removeFromStat(freq: storage[key]!.freq, key: key)
            storage[key]!.freq += 1
            add(freq: storage[key]!.freq, key: key)
            storage[key]?.value = value
            return
        }
        if storage.keys.count < capacity {
            storage[key] = CacheItem(key: key, value: value, freq: 1)
            add(freq: 1, key: key)
            return
        }
        
        let badItem = stat.sorted { a, b in
            a.value.order < b.value.order
        }
        let badKey = badItem.first!.value.keys[0]
        storage.removeValue(forKey: badKey)
        removeFromStat(freq: badItem.first!.key, key: badKey)
        storage[key] = CacheItem(key: key, value: value, freq: 1)
        add(freq: 1, key: key)
    }
    
    func add(freq: Int, key: Int) {
        if stat[freq] != nil {
            stat[freq]!.keys.append(key)
        } else {
            let max = stat.max { a, b in
                a.value.order > b.value.order
            }?.value.order ?? 0
            stat[freq] = StatItem(keys: [key], order: max + 1)
        }
    }
    
    func removeFromStat(freq: Int, key: Int) {
        if stat[freq]?.keys.count == 1 {
            stat.removeValue(forKey: freq)
        } else if let index = stat[freq]?.keys.firstIndex(of: key) {
            stat[freq]?.keys.remove(at: index)
        }
    }
}
