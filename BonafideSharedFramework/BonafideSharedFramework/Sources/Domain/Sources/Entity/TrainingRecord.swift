//
//  TrainingRecord.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Foundation

public struct TrainingRecord: Equatable, Identifiable {
    public var id: String
    public var dateTime: Date
    public var durationInSeconds: Int?
    public var menuName: String
    public var note: String
    public var reps: Int
    public var satisfaction: String
    public var sets: Int
    public var totalWeight: Double
    public var usedItems: [String]

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
