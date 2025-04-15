//
//  FetchAllDeviceUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Domain

public struct FetchAllDeviceUseCaseImpl: FetchAllDeviceUseCase {
    private let deviceRepository: DeviceRepository
    
    public init(deviceRepository: DeviceRepository) {
        self.deviceRepository = deviceRepository
    }
    
    public func callAsFunction(for store: Store?) async throws(DomainError) -> [Device] {
        if let store {
            return try await deviceRepository.fetchAll(for: store)
        }
        return try await deviceRepository.fetchAll()
    }
}
