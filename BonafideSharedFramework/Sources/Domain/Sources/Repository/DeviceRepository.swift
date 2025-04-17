//
//  DeviceRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol DeviceRepository: Sendable {
    func register(_ device: Device) async throws(DomainError)
    func delete(_ deviceId: String) async throws(DomainError)
    func update(_ device: Device) async throws(DomainError)
    func fetchAll() async throws(DomainError) -> [Device]
    func fetchAll(for store: Store) async throws(DomainError) -> [Device]
    func fetchDetail(deviceId: String) async throws(DomainError) -> Device
    func streamConnectedUserId(deviceId : String) async -> AsyncThrowingStream<String, any Error>
}
