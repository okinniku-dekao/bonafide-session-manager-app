//
//  RegisterDeviceUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Domain

public struct RegisterDeviceUseCaseImpl: RegisterDeviceUseCase {
    private let deviceRepository: DeviceRepository
    
    public init(deviceRepository: DeviceRepository) {
        self.deviceRepository = deviceRepository
    }
    
    public func callAsFunction(_ device: Device) async throws (DomainError) {
        try device.validation()
        try await deviceRepository.register(device)
    }
}
