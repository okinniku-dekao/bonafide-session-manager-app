//
//  SessionDTO.swift
//  Data
//
//  Created by Claude on 2025/04/13.
//

import Foundation
import Domain

public struct SessionDTO: Identifiable, Codable, Equatable, Sendable {
    public let id: String
    public let name: String
    public let note: String
    public let number: Int
    public let path: String
    public let tool: String
    
    public init(id: String, name: String, note: String, number: Int, path: String, tool: String) {
        self.id = id
        self.name = name
        self.note = note
        self.number = number
        self.path = path
        self.tool = tool
    }
    
    public var toDomain: Session {
        return Session(
            id: id,
            name: name,
            note: note,
            number: number,
            path: path,
            tool: tool
        )
    }
    
    public init(from domain: Session) {
        self.id = domain.id
        self.name = domain.name
        self.note = domain.note
        self.number = domain.number
        self.path = domain.path
        self.tool = domain.tool
    }
}
