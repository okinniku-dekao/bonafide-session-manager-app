//
//  SaveDeviceIdUseCase.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import Foundation

public protocol SaveDeviceIdUseCase: Sendable {
    func callAsFunction(_ deviceId: UUID) async throws(DomainError)
}
