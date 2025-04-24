//
//  DeviceRepositoryImpl.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct DeviceRepositoryImpl: DeviceRepository {
    private let firebaseDataSource: FirebaseDataSource
    
    public init(firebaseDataSource: FirebaseDataSource) {
        self.firebaseDataSource = firebaseDataSource
    }
    
    public func register(_ device: Device) async throws(DomainError) {
        do {
            try await firebaseDataSource.registerDevice(.init(from: device))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func delete(_ deviceId: String) async throws(DomainError) {
        do {
            try await firebaseDataSource.deleteDevice(deviceId)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func update(_ device: Device) async throws(DomainError) {
        do {
            try await firebaseDataSource.updateDevice(.init(from: device))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll() async throws(DomainError) -> [Device] {
        do {
            return try await firebaseDataSource.fetchAllDevice().map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll(for store: Store) async throws(DomainError) -> [Device] {
        do {
            let storeDTO = StoreDTO(from: store)
            return try await firebaseDataSource.fetchAllDevice()
                .filter { $0.store == storeDTO }
                .map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchDetail(deviceId: String) async throws(DomainError) -> Device {
        do {
            return try await firebaseDataSource.fetchDeviceDetail(deviceId).toDomain
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func streamConnectedUserId(deviceId: String) async -> AsyncThrowingStream<String, any Error> {
        await firebaseDataSource.streamConnectedUserId(deviceId: deviceId)
            .mapStream { $0 }
    }
}
