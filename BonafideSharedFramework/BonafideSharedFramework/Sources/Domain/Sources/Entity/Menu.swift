//
//  Menu.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Foundation

public struct Menu: Equatable, Identifiable, Hashable {
    public let id: String
    public let name: String
    public let number: Int
    public let path: String
    
    public init(
        id: String = UUID().uuidString,
        name: String,
        number: Int,
        path: String = ""
    ) {
        self.id = id
        self.name = name
        self.number = number
        self.path = path
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
