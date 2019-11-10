//
//  KeychainService.swift
//  EkreativeSnacks
//
//  Created by Alex on 10/31/19.
//  Copyright © 2019 Oleksand Atamanskyi. All rights reserved.
//

import KeychainSwift

struct KeychainKeys {
    static let userData = "user-data"
    
    static let all = [userData]
}

final class KeychainService {
    private var keyPrefix = ""
    private lazy var keychain = KeychainSwift(keyPrefix: keyPrefix)
    
    struct Prefix {
        static let main = "com.ekreative.EkreativeSnacks"
        static let test = "com.ekreative.EkreativeSnacksTests"
    }
    
    init(keyPrefix: String) {
        self.keyPrefix = keyPrefix
    }
    
    func get(key: String) -> String {
        return keychain.get(key) ?? ""
    }
    
    func set(value: String, key: String) {
        keychain.set(value, forKey: key)
    }
    
    func delete(key: String) {
        keychain.delete(key)
    }
    
    func clear() {
        KeychainKeys.all.forEach { self.keychain.delete($0) }
    }
    
    func isValueExists(key: String) -> Bool {
        return keychain.get(key) != nil
    }
}
