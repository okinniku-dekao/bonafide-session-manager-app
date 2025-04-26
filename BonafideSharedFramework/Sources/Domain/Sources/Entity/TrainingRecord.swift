//
//  TrainingRecord.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Foundation

public struct TrainingRecord: Equatable, Identifiable, Sendable {
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
        id: String = UUID().uuidString,
        dateTime: Date = Date(),
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
    
    public static func newRecord(
        id: UUID,
        recordAt: Date,
        menuName: String
    ) -> TrainingRecord {
        .init(
            id: id.uuidString,
            dateTime: recordAt,
            durationInSeconds: nil,
            menuName: menuName,
            note: "",
            reps: 10,
            satisfaction: "",
            sets: 0,
            totalWeight: 0.0,
            usedItems: []
        )
    }
}

public extension TrainingRecord {
    mutating func updateTotalWeight(value: Double) {
        self.totalWeight = value
    }

    func validation(recodType: RecordType) throws(DomainError) {
        switch recodType {
        case .timeBase:
            guard let durationInSeconds, durationInSeconds > 0 else {
                throw DomainError.validation(.invalidDurationValue)
            }
        case .weightBase:
            guard totalWeight > 0, reps > 0, sets > 0 else {
                throw DomainError.validation(.invalidWeightValue)
            }
        }

        guard !satisfaction.isEmpty else {
            throw DomainError.validation(.invalidSatisfaction)
        }
    }
}
