//
//  KeychainRepository.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import Foundation

public protocol KeychainRepository: Sendable {
    func saveDeviceId(_ id: UUID) async throws(DomainError)
    func loadDeviceId() async throws(DomainError) -> UUID
}
