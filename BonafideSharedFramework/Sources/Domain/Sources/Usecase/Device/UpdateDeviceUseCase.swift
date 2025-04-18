//
//  UpdateDeviceUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol UpdateDeviceUseCase: Sendable {
    func callAsFunction(_ device: Device) async throws(DomainError)
}
