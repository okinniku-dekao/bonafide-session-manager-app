//
//  DeviceRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol DeviceRepository {
    func register(_ device: Device) async throws
    func delete(_ deviceId: String) async throws
    func update(_ device: Device) async throws
    func fetchAll() async throws -> [Device]
    func fetchAll(for store: Store) async throws -> [Device]
}
