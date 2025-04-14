//
//  DeleteDeviceUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Domain

public struct DeleteDeviceUseCaseImpl: DeleteDeviceUseCase {
    private let deviceRepository: DeviceRepository
    
    public init(deviceRepository: DeviceRepository) {
        self.deviceRepository = deviceRepository
    }
    
    public func callAsFunction(deviceId: String) async throws(DomainError) {
        try await deviceRepository.delete(deviceId)
    }
}
