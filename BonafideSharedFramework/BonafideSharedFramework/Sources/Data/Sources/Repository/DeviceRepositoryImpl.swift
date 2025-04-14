//
//  DeviceRepositoryImpl.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct DeviceRepositoryImpl: DeviceRepository {
    private let firebaseDataStore: FirebaseDataStore
    
    public init(firebaseDataStore: FirebaseDataStore) {
        self.firebaseDataStore = firebaseDataStore
    }
    
    public func register(_ device: Device) async throws(DomainError) {
        do {
            try await firebaseDataStore.registerDevice(.init(from: device))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func delete(_ deviceId: String) async throws(DomainError) {
        do {
            try await firebaseDataStore.deleteDevice(deviceId)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func update(_ device: Device) async throws(DomainError) {
        do {
            try await firebaseDataStore.updateDevice(.init(from: device))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll() async throws(DomainError) -> [Device] {
        do {
            return try await firebaseDataStore.fetchAllDevice().map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll(for store: Store) async throws(DomainError) -> [Device] {
        do {
            let storeDTO = StoreDTO(from: store)
            return try await firebaseDataStore.fetchAllDevice()
                .filter { $0.store == storeDTO }
                .map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
}
