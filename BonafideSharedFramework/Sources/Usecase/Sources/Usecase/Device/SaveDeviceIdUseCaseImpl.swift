//
//  SaveDeviceIdUseCaseImpl.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import Foundation
import Domain

public struct SaveDeviceIdUseCaseImpl: SaveDeviceIdUseCase {
    private let keychainRepository: KeychainRepository
    
    public init(keychainRepository: KeychainRepository) {
        self.keychainRepository = keychainRepository
    }
    
    public func callAsFunction(_ deviceId: UUID) async throws(DomainError) {
        try await keychainRepository.saveDeviceId(deviceId)
    }
}
