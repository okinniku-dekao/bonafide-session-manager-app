//
//  Session.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public struct Session: Identifiable, Equatable, Sendable {
    public var id: String
    public var name: String
    public var note: String
    public var number: Int
    public var path: String
    
    public init(id: String, name: String, note: String, number: Int, path: String) {
        self.id = id
        self.name = name
        self.note = note
        self.number = number
        self.path = path
    }
}
