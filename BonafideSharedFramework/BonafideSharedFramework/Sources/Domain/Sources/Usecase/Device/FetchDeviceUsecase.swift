//
//  FetchDeviceUsecase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol FetchDeviceUsecase {
    func callAsFunction() -> [Device]
}

public protocol DeleteDeviceUsecase {
    func callAsFunction(deviceId: String) async throws
}



public protocol DeviceRepository {
    func register(device: Device) async throws
    func delete(deviceId: String) async throws
    func update(device: Device) async throws
    func fetchAll() async throws -> [Device]
    func fetchAll(for store: Store) async throws -> [Device]
}
