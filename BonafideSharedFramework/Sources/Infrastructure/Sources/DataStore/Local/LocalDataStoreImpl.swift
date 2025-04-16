//
//  LocalDataStoreImpl.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import Data
import Foundation

public struct LocalDataStoreImpl: LocalDataStore {
    private let service: String
    
    public init(service: String) {
        self.service = service
    }
    
    public func saveDeviceId(_ deviceId: UUID) async throws(DataStoreError) {
        guard let deviceIdData = deviceId.uuidString.data(using: .utf8) else {
            throw .faildConvertToData
        }
        let saved = await KeychainManager.shared.save(
            service: service,
            key: KeychainKey.deviceId,
            data: deviceIdData
        )
        if !saved {
            throw .faildSaveData
        }
    }
    
    public func getDeviceId() async throws(DataStoreError) -> UUID {
        guard let data = await KeychainManager.shared.load(
            service: service,
            key: KeychainKey.deviceId
        ),
              let uuidString = String(data: data, encoding: .utf8),
              let uuid = UUID(uuidString: uuidString) else {
            throw .notSaved
        }
        return uuid
    }
}
