//
//  UserDTO.swift
//  Data
//
//  Created by Claude on 2025/04/13.
//

import Foundation
import Domain

public struct UserDTO: Identifiable, Codable, Equatable, Sendable {
    public let id: String
    public let name: String
    public let birthdate: Date?
    public let joinDate: Date?
    public let isInstaFollowed: Bool
    public let isReviewed: Bool
    public let goal: String
    public let note: String
    public let store: StoreDTO
    public let trainingMemo: String
    public let menus: [MenuNoteDTO]
    public let sessions: [SessionDTO]
    
    public init(
        id: String,
        name: String,
        birthdate: Date?,
        joinDate: Date?,
        isInstaFollowed: Bool,
        isReviewed: Bool,
        goal: String,
        note: String,
        store: StoreDTO,
        trainingMemo: String,
        menus: [MenuNoteDTO],
        sessions: [SessionDTO]
    ) {
        self.id = id
        self.name = name
        self.birthdate = birthdate
        self.joinDate = joinDate
        self.isInstaFollowed = isInstaFollowed
        self.isReviewed = isReviewed
        self.goal = goal
        self.note = note
        self.store = store
        self.trainingMemo = trainingMemo
        self.menus = menus
        self.sessions = sessions
    }
    
    public var toDomain: User {
        return User(
            id: id,
            name: name,
            birthdate: birthdate,
            joinDate: joinDate,
            isInstaFollowed: isInstaFollowed,
            isReviewed: isReviewed,
            goal: goal,
            note: note,
            store: store.toDomain,
            trainingMemo: trainingMemo,
            menus: menus.map { $0.toDomain },
            sessions: sessions.map { $0.toDomain }
        )
    }
    
    public init(from domain: User) {
        self.id = domain.id
        self.name = domain.name
        self.birthdate = domain.birthdate
        self.joinDate = domain.joinDate
        self.isInstaFollowed = domain.isInstaFollowed
        self.isReviewed = domain.isReviewed
        self.goal = domain.goal
        self.note = domain.note
        self.store = StoreDTO(from: domain.store)
        self.trainingMemo = domain.trainingMemo
        self.menus = domain.menus.map { MenuNoteDTO(from: $0) }
        self.sessions = domain.sessions.map { SessionDTO(from: $0) }
    }
}
