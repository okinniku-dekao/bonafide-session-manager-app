//
//  MenuNote.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

public struct MenuNote: Equatable, Identifiable, Hashable {
    public var id: String
    public var menu: Menu
    public var memo: String
    
    public init(id: String, menu: Menu, memo: String) {
        self.id = id
        self.menu = menu
        self.memo = memo
    }
}
