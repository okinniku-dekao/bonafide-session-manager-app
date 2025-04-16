//
//  KeychainRepositoryImpl.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import Foundation
import Domain

public struct KeychainRepositoryImpl: KeychainRepository {
    private let localDataStore: LocalDataStore
    
    public init(localDataStore: LocalDataStore) {
        self.localDataStore = localDataStore
    }
    
    public func saveDeviceId(_ id: UUID) async throws(DomainError) {
        do {
            try await localDataStore.saveDeviceId(id)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func loadDeviceId() async throws(DomainError) -> UUID {
        do {
            return try await localDataStore.getDeviceId()
        } catch {
            throw DomainError(from: error)
        }
    }
}
