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
    public let trainingRecords: [TrainingRecordDTO]
    
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
        sessions: [SessionDTO],
        trainingRecords: [TrainingRecordDTO]
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
            sessions: sessions.map { $0.toDomain },
            trainingRecords: trainingRecords.map { $0.toDomain }
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
        self.trainingRecords = domain.trainingRecords.map { TrainingRecordDTO(from: $0) }
    }
}

// MARK: - Codable
public extension UserDTO {
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        if let birthdateString = try container.decodeIfPresent(String.self, forKey: .birthdate) {
            birthdate = dateFormatter.date(from: birthdateString)
        } else {
            birthdate = nil
        }
        
        if let joinDateString = try container.decodeIfPresent(String.self, forKey: .joinDate) {
            joinDate = dateFormatter.date(from: joinDateString)
        } else {
            joinDate = nil
        }
        
        isInstaFollowed = try container.decode(Bool.self, forKey: .isInstaFollowed)
        isReviewed = try container.decode(Bool.self, forKey: .isReviewed)
        goal = try container.decode(String.self, forKey: .goal)
        note = try container.decode(String.self, forKey: .note)
        store = try container.decode(StoreDTO.self, forKey: .store)
        trainingMemo = try container.decode(String.self, forKey: .trainingMemo)
        menus = try container.decodeIfPresent([MenuNoteDTO].self, forKey: .menus) ?? []
        sessions = try container.decodeIfPresent([SessionDTO].self, forKey: .sessions) ?? []
        trainingRecords = try container.decodeIfPresent([TrainingRecordDTO].self, forKey: .trainingRecords) ?? []
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case birthdate
        case joinDate
        case isInstaFollowed
        case isReviewed
        case goal
        case note
        case store
        case trainingMemo
        case menus
        case sessions
        case trainingRecords
    }
}
