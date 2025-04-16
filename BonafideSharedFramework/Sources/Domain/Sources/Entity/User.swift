//
//  User.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Foundation

public struct User: Identifiable, Equatable, Sendable {
    public var id: String
    public var name: String
    public var birthdate: Date?
    public var joinDate: Date?
    public var isInstaFollowed: Bool
    public var isReviewed: Bool
    public var goal: String
    public var note: String
    public var store: Store
    public var trainingMemo: String
    public var menus: [MenuNote]
    public var sessions: [Session]
    public var trainingRecords: [TrainingRecord]
    
    public init(
        id: String,
        name: String,
        birthdate: Date?,
        joinDate: Date?,
        isInstaFollowed: Bool,
        isReviewed: Bool,
        goal: String,
        note: String,
        store: Store,
        trainingMemo: String,
        menus: [MenuNote],
        sessions: [Session],
        trainingRecords: [TrainingRecord]
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
        self.trainingRecords = trainingRecords
    }
}

public extension User {
    func validation() throws(DomainError) {
        guard !name.isEmpty else { throw DomainError.validation(.invalidUserName) }
    }
}
