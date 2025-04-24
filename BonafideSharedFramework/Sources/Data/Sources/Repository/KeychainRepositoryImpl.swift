//
//  KeychainRepositoryImpl.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import Domain

public struct KeychainRepositoryImpl: KeychainRepository {
    private let localDataSource: LocalDataSource
    
    public init(localDataSource: LocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    public func saveDeviceId(_ id: String) async throws(DomainError) {
        do {
            try await localDataSource.saveDeviceId(id)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func loadDeviceId() async throws(DomainError) -> String {
        do {
            return try await localDataSource.getDeviceId()
        } catch {
            throw DomainError(from: error)
        }
    }
}
