//
//  TrainingRecordDTO.swift
//  Data
//
//  Created by Claude on 2025/04/13.
//

import Foundation
import Domain

public struct TrainingRecordDTO: Identifiable, Codable, Equatable, Sendable {
    public let id: String
    public let dateTime: Date
    public let durationInSeconds: Int?
    public let menuName: String
    public let note: String
    public let reps: Int
    public let satisfaction: String
    public let sets: Int
    public let totalWeight: Double
    public let usedItems: [String]
    
    public init(
        id: String,
        dateTime: Date,
        durationInSeconds: Int?,
        menuName: String,
        note: String,
        reps: Int,
        satisfaction: String,
        sets: Int,
        totalWeight: Double,
        usedItems: [String]
    ) {
        self.id = id
        self.dateTime = dateTime
        self.durationInSeconds = durationInSeconds
        self.menuName = menuName
        self.note = note
        self.reps = reps
        self.satisfaction = satisfaction
        self.sets = sets
        self.totalWeight = totalWeight
        self.usedItems = usedItems
    }
    
    public var toDomain: TrainingRecord {
        return TrainingRecord(
            id: id,
            dateTime: dateTime,
            durationInSeconds: durationInSeconds,
            menuName: menuName,
            note: note,
            reps: reps,
            satisfaction: satisfaction,
            sets: sets,
            totalWeight: totalWeight,
            usedItems: usedItems
        )
    }
    
    public init(from domain: TrainingRecord) {
        self.id = domain.id
        self.dateTime = domain.dateTime
        self.durationInSeconds = domain.durationInSeconds
        self.menuName = domain.menuName
        self.note = domain.note
        self.reps = domain.reps
        self.satisfaction = domain.satisfaction
        self.sets = domain.sets
        self.totalWeight = domain.totalWeight
        self.usedItems = domain.usedItems
    }
    
    private let trainingRecordDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.timeZone = TimeZone(secondsFromGMT: 9 * 3600) // UTC+9
        formatter.dateFormat = "yyyy年M月d日 HH:mm:ss 'UTC+9'"
        return formatter
    }()
}

// MARK: - Codable
public extension TrainingRecordDTO {
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        
        dateTime = try container.decode(Date.self, forKey: .dateTime)
        
        durationInSeconds = try container.decodeIfPresent(Int.self, forKey: .durationInSeconds)
        menuName = try container.decode(String.self, forKey: .menuName)
        note = try container.decode(String.self, forKey: .note)
        reps = try container.decode(Int.self, forKey: .reps)
        satisfaction = try container.decode(String.self, forKey: .satisfaction)
        sets = try container.decode(Int.self, forKey: .sets)
        totalWeight = try container.decode(Double.self, forKey: .totalWeight)
        usedItems = try container.decode([String].self, forKey: .usedItems)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case dateTime
        case durationInSeconds
        case menuName
        case note
        case reps
        case satisfaction
        case sets
        case totalWeight
        case usedItems
    }
}
