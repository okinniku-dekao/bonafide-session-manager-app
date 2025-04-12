//
//  Device.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Foundation

public struct Device: Identifiable, Equatable {
    public let id: String
    public let deviceName: String
    public let connectedUserId: String
    public let isActive: Bool
    public let registeredAt: Date
    public let store: Store
    
    public init(id: String, deviceName: String, connectedUserId: String, isActive: Bool, registeredAt: Date, store: Store) {
        self.id = id
        self.deviceName = deviceName
        self.connectedUserId = connectedUserId
        self.isActive = isActive
        self.registeredAt = registeredAt
        self.store = store
    }
}
