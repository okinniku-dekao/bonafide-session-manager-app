//
//  Menu.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

public struct Menu: Equatable, Identifiable {
    public let id: String
    public let name: String
    public let number: Int
    public let path: String
    
    public init(id: String, name: String, number: Int, path: String) {
        self.id = id
        self.name = name
        self.number = number
        self.path = path
    }
}
