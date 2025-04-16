//
//  Device.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Foundation

public struct Device: Identifiable, Equatable, Sendable {
    public var id: String
    public var deviceName: String
    public var connectedUserId: String
    public var isActive: Bool
    public var registeredAt: Date
    public var store: Store
    
    public init(
        id: String = UUID().uuidString,
        deviceName: String = "",
        connectedUserId: String = "",
        isActive: Bool = false,
        registeredAt: Date = Date(),
        store: Store = .seiwa)
    {
        self.id = id
        self.deviceName = deviceName
        self.connectedUserId = connectedUserId
        self.isActive = isActive
        self.registeredAt = registeredAt
        self.store = store
    }
}

public extension Device {
    func validation() throws(DomainError) {
        guard !deviceName.isEmpty else {
            throw DomainError.validation(.invalidDeviceName)
        }
    }
}
