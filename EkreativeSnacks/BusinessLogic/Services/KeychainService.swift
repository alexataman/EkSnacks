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
}

final class KeychainService {
    private let keychain = KeychainSwift(keyPrefix: "com.ekreative.EkreativeSnacks")
    
    func get(key: String) -> String {
        return keychain.get(key) ?? ""
    }
    
    func set(value: String, key: String) {
        keychain.set(value, forKey: key)
    }
    
    func delete(key: String) {
        keychain.delete(key)
    }
    
    func isValueExists(key: String) -> Bool {
        return keychain.get(key) != nil
    }
}
