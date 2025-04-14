//
//  DeviceDTO.swift
//  Data
//
//  Created by Claude on 2025/04/13.
//

import Foundation
import Domain

public struct DeviceDTO: Identifiable, Codable, Equatable, Sendable {
    public let id: String
    public let deviceName: String
    public let connectedUserId: String
    public let isActive: Bool
    public let registeredAt: Date
    public let store: StoreDTO
    
    public init(id: String, deviceName: String, connectedUserId: String, isActive: Bool, registeredAt: Date, store: StoreDTO) {
        self.id = id
        self.deviceName = deviceName
        self.connectedUserId = connectedUserId
        self.isActive = isActive
        self.registeredAt = registeredAt
        self.store = store
    }
    
    public var toDomain: Device {
        return Device(
            id: id,
            deviceName: deviceName,
            connectedUserId: connectedUserId,
            isActive: isActive,
            registeredAt: registeredAt,
            store: store.toDomain
        )
    }
    
    public init(from domain: Device) {
        self.id = domain.id
        self.deviceName = domain.deviceName
        self.connectedUserId = domain.connectedUserId
        self.isActive = domain.isActive
        self.registeredAt = domain.registeredAt
        self.store = StoreDTO(from: domain.store)
    }
}
