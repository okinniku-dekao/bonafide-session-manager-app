//
//  GetDeviceIdUseCaseImpl.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import Foundation
import Domain

public struct GetDeviceIdUseCaseImpl: GetDeviceIdUseCase {
    private let keychainRepository: KeychainRepository
    
    public init(keychainRepository: KeychainRepository) {
        self.keychainRepository = keychainRepository
    }
    
    public func callAsFunction() async throws(DomainError) -> UUID {
        try await keychainRepository.loadDeviceId()
    }
}
