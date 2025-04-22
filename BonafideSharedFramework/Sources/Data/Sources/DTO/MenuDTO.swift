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
    public let note: String
    public let path: String
    
    public init(id: String, name: String, number: Int, note: String, path: String) {
        self.id = id
        self.name = name
        self.number = number
        self.note = note
        self.path = path
    }
    
    public var toDomain: Menu {
        return Menu(
            id: id,
            name: name,
            number: number,
            note: note,
            path: path.hasSuffix(".gif") ? String(path.dropLast(4)) : path
        )
    }
    
    public init(from domain: Menu) {
        self.id = domain.id
        self.name = domain.name
        self.number = domain.number
        self.note = domain.note
        self.path = domain.path
    }
}
