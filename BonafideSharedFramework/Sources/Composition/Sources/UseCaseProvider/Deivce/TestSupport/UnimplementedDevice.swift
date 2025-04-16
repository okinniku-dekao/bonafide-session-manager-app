//
//  UnimplementedDevice.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Foundation
import Domain

struct UnimplementedDeleteDeviceUseCase: DeleteDeviceUseCase {
    func callAsFunction(deviceId: String) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedFetchAllDeviceUserCase: FetchAllDeviceUseCase {
    func callAsFunction(for store: Domain.Store?) async throws(DomainError) -> [Device] {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedFetchDeviceDetailUseCase: FetchDeviceDetailUseCase {
    func callAsFunction(deviceId: String) async throws(DomainError) -> Device {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedRegisterDeviceUseCase: RegisterDeviceUseCase {
    func callAsFunction(_ device: Device) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedUpdateDeviceUseCase: UpdateDeviceUseCase {
    func callAsFunction(_ device: Device) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedGetDeviceIdUseCase: GetDeviceIdUseCase {
    func callAsFunction() async throws(DomainError) -> String {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}
