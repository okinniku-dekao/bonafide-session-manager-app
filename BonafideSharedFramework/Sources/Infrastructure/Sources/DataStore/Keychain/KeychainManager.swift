//
//  KeychainManager.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//


import Foundation
import Security

actor KeychainManager {
    static let shared = KeychainManager()
    
    private init() {}
    
    private func getKeychainQuery(for service: String, key: String) -> [CFString: Any] {
        return [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: key,
            kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlock
        ]
    }
    
    func save(service: String, key: String, data: Data) -> Bool {
        let query = getKeychainQuery(for: service, key: key)
        
        // すでにデータが存在している場合は削除
        SecItemDelete(query as CFDictionary)
        
        // 新しいデータを保存
        let attributes: [CFString: Any] = [
            kSecValueData: data
        ]
        
        let status = SecItemAdd(query.merging(attributes) { (_, new) in new } as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    func load(service: String, key: String) -> Data? {
        let query = getKeychainQuery(for: service, key: key)
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess, let data = result as? Data else { return nil }
        return data
    }
    
    func delete(service: String, key: String) -> Bool {
        let query = getKeychainQuery(for: service, key: key)
        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
    
    func update(service: String, key: String, data: Data) -> Bool {
        let query = getKeychainQuery(for: service, key: key)
        
        let attributes: [CFString: Any] = [
            kSecValueData: data
        ]
        
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        return status == errSecSuccess
    }
}
