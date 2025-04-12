//
//  Session.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public struct Session: Identifiable, Equatable {
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
}
