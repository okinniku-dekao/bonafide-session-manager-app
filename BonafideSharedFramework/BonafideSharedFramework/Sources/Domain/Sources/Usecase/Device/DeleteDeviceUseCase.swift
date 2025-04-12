//
//  DeleteDeviceUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol DeleteDeviceUseCase {
    func callAsFunction(deviceId: String) async throws(DomainError)
}
