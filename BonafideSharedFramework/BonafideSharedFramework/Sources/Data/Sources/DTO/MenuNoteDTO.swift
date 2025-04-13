//
//  MenuNoteDTO.swift
//  Data
//
//  Created by Claude on 2025/04/13.
//

import Foundation
import Domain

public struct MenuNoteDTO: Identifiable, Codable, Equatable, Hashable {
    public let id: String
    public let menu: MenuDTO
    public let memo: String
    
    public init(id: String, menu: MenuDTO, memo: String) {
        self.id = id
        self.menu = menu
        self.memo = memo
    }
    
    public func toDomain() -> MenuNote {
        return MenuNote(
            id: id,
            menu: menu.toDomain(),
            memo: memo
        )
    }
    
    public init(from domain: MenuNote) {
        self.id = domain.id
        self.menu = MenuDTO(from: domain.menu)
        self.memo = domain.memo
    }
}
