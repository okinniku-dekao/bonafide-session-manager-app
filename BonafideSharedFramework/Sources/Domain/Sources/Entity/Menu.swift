//
//  Menu.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Foundation

public struct Menu: Equatable, Identifiable, Hashable, Sendable {
    public var id: String
    public var name: String
    public var number: Int
    public var category: MenuCategory {
        MenuCategory(number)
    }
    
    public init(
        id: String = UUID().uuidString,
        name: String,
        number: Int,
    ) {
        self.id = id
        self.name = name
        self.number = number
    }
}

public extension Menu {
    func validation() throws(DomainError) {
        guard !name.isEmpty else {
            throw DomainError.validation(.invalidMenuName)
        }
        guard number == 0 else {
            throw DomainError.validation(.invalidMenuNumber)
        }
    }
}
