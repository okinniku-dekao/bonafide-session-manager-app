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
}
