//
//  GetDeviceIdUseCase.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import Foundation

public protocol GetDeviceIdUseCase: Sendable {
    func callAsFunction() async throws(DomainError) -> UUID
}
