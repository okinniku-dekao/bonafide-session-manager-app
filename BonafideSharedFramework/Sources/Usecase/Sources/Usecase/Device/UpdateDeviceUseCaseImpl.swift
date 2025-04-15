//
//  UpdateDeviceUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Domain

public struct UpdateDeviceUseCaseImpl: UpdateDeviceUseCase {
    private let deviceRepository: DeviceRepository
    
    public init(deviceRepository: DeviceRepository) {
        self.deviceRepository = deviceRepository
    }
    
    public func callAsFunction(_ device: Device) async throws(DomainError) {
        try await deviceRepository.update(device)
    }
}
