//
//  MenuNote.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

public struct MenuNote: Equatable, Identifiable, Hashable {
    public let id: String
    public let menu: Menu
    public let memo: String
    
    public init(menu: Menu, memo: String) {
        self.menu = menu
        self.memo = memo
    }
}
