//
//  MenuDTO.swift
//  Data
//
//  Created by Claude on 2025/04/13.
//

import Foundation
import Domain

public struct MenuDTO: Identifiable, Codable, Equatable, Hashable, Sendable {
    public let id: String
    public let name: String
    public let number: Int
    
    public init(id: String, name: String, number: Int) {
        self.id = id
        self.name = name
        self.number = number
    }
    
    public var toDomain: Menu {
        return Menu(
            id: id,
            name: name,
            number: number
        )
    }
    
    public init(from domain: Menu) {
        self.id = domain.id
        self.name = domain.name
        self.number = domain.number
    }
}
