//
//  RegisterDeviceUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Domain

public struct RegisterDeviceUseCaseImpl: RegisterDeviceUseCase {
    private let deviceRepository: DeviceRepository
    private let keychainRepository: KeychainRepository
    
    public init(
        deviceRepository: DeviceRepository,
        keychainRepository: KeychainRepository
    ) {
        self.deviceRepository = deviceRepository
        self.keychainRepository = keychainRepository
    }
    
    public func callAsFunction(_ device: Device) async throws (DomainError) {
        try device.validation()
        try await deviceRepository.register(device)
        try await keychainRepository.saveDeviceId(device.id)
    }
}
