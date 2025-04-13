//
//  WeightDTO.swift
//  Data
//
//  Created by Claude on 2025/04/13.
//

import Foundation
import Domain

public struct WeightDTO: Identifiable, Codable, Equatable, Hashable {
    public let id: String
    public let name: String
    public let color: Int
    public let value: Double
    
    public init(id: String, name: String, color: Int, value: Double) {
        self.id = id
        self.name = name
        self.color = color
        self.value = value
    }
    
    public var toDomain: Weight {
        return Weight(
            id: id,
            name: name,
            color: color,
            value: value
        )
    }
    
    public init(from domain: Weight) {
        self.id = domain.id
        self.name = domain.name
        self.color = domain.color
        self.value = domain.value
    }
}
