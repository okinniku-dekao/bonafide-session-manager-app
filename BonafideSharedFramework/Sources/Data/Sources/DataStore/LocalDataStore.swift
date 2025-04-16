//
//  LocalDataStore.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

public protocol LocalDataStore: Sendable {
    // MARK: - Keychain
    func saveDeviceId(_ deviceId: String) async throws(DataStoreError)
    func getDeviceId() async throws(DataStoreError) -> String
}

