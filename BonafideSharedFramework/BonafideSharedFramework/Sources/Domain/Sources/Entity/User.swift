//
//  User.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Foundation

public struct User: Identifiable, Equatable {
    public let id: String
    public let name: String
    public let birthdate: Date
    public let joinDate: Date
    public let isInstaFollowed: Bool
    public let isReviewed: Bool
    public let goal: String
    public let note: String
    public let store: String
    public let trainingMemo: String
    public let menus: [Menu]
    public let sessions: [Session]
    
    public init(
        id: String,
        name: String,
        birthdate: Date,
        joinDate: Date,
        isInstaFollowed: Bool,
        isReviewed: Bool,
        goal: String,
        note: String,
        store: String,
        trainingMemo: String,
        menus: [Menu],
        sessions: [Session]
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
}
