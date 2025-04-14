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
    
    public init(
        id: String = UUID().uuidString,
        deviceName: String,
        connectedUserId: String,
        isActive: Bool = false,
        registeredAt: Date = Date(),
        store: Store = .owada)
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
