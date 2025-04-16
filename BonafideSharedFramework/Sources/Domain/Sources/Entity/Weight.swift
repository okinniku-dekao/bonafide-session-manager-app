//
//  Weight.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

public struct Weight: Equatable, Identifiable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var color: Int
    public var value: Double
    
    public init(id: String, name: String, color: Int, value: Double) {
        self.id = id
        self.name = name
        self.color = color
        self.value = value
    }
}
