//
//  TrainingRecord.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Foundation

public struct TrainingRecord: Equatable, Identifiable {
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
}
