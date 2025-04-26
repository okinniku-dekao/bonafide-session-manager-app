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
    
    mutating func incrementTimeDuration(time: Int) {
        if var durationInSeconds {
            durationInSeconds += time
            self.durationInSeconds = durationInSeconds
        } else {
            self.durationInSeconds = time
        }
    }
    
    mutating func decrementTimeDuration(time: Int) {
        guard var durationInSeconds else { return }
        durationInSeconds -= time
        if durationInSeconds > 0 {
            self.durationInSeconds = durationInSeconds
        } else {
            self.durationInSeconds = nil
        }
    }
    
    mutating func incrementSets() {
        self.sets += 1
    }
    
    mutating func decrementSets() {
        if self.sets > 0 {
            self.sets -= 1
        }
    }
    
    mutating func incrementReps() {
        self.reps += 1
    }
    
    mutating func decrementReps() {
        if self.reps > 0 {
            self.reps -= 1
        }
    }

    func validation(recodType: RecordType) throws(DomainError) {
        switch recodType {
        case .timeBase:
            if let durationInSeconds, durationInSeconds == 0 {
                throw DomainError.validation(.invalidDurationValue)
            }
            if durationInSeconds == nil && (reps == 0 || sets == 0) {
                throw DomainError.validation(.invalidSetsAndReps)
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
