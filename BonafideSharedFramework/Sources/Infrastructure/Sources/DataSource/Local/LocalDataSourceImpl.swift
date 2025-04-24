//
//  LocalDataSourceImpl.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import Data
import Foundation

public struct LocalDataSourceImpl: LocalDataSource {
    private let service: String
    
    public init(service: String) {
        self.service = service
    }
    
    public func saveDeviceId(_ deviceId: String) async throws(DataSourceError) {
        guard let deviceIdData = deviceId.data(using: .utf8) else {
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
    
    public func getDeviceId() async throws(DataSourceError) -> String {
        guard let data = await KeychainManager.shared.load(
            service: service,
            key: KeychainKey.deviceId
        ),
              let uuidString = String(data: data, encoding: .utf8)  else {
            throw .notSaved
        }
        return uuidString
    }
}
