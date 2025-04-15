//
//  FetchDeviceDetailUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol FetchDeviceDetailUseCase: Sendable {
    func callAsFunction(deviceId: String) async throws(DomainError) -> Device
}
