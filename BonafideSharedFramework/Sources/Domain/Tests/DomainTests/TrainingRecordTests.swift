//
//  TrainingRecordTests.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/15.
//

import Testing
@testable import Domain

struct TrainingRecordTests {
    // MARK: 成功
    @Test(".timeBase 成功")
    func testTimeBaseSuccess() throws {
        let record = TrainingRecord(
            durationInSeconds: 100,
            menuName: "テスト",
            note: "",
            reps: 0,
            satisfaction: "満足",
            sets: 0,
            totalWeight: 0,
            usedItems: []
        )
        try record.validation(recodType: .timeBase)
    }
    
    @Test(".timeBase 成功 境界値チェック")
    func testTimeBaseSuccessCheckBoundary() throws {
        let record = TrainingRecord(
            durationInSeconds: 1,
            menuName: "テスト",
            note: "",
            reps: 0,
            satisfaction: "満足",
            sets: 0,
            totalWeight: 0,
            usedItems: []
        )
        try record.validation(recodType: .timeBase)
    }
    
    @Test(".weightBase 成功")
    func testWeightBaseSuccess() throws {
        let record = TrainingRecord(
            durationInSeconds: nil,
            menuName: "テスト",
            note: "",
            reps: 10,
            satisfaction: "満足",
            sets: 3,
            totalWeight: 100,
            usedItems: []
        )
        try record.validation(recodType: .weightBase)
    }
    
    @Test(".weightBase 成功 境界値チェック")
    func testWeightBaseSuccessCheckBoundary() throws {
        let record = TrainingRecord(
            durationInSeconds: nil,
            menuName: "テスト",
            note: "",
            reps: 1,
            satisfaction: "満足",
            sets: 1,
            totalWeight: 1,
            usedItems: []
        )
        try record.validation(recodType: .weightBase)
    }
    
    // MARK: 失敗
    @Test("validation: timeBaseで時間がnil")
    func testValidationTimeBaseIsNil() throws {
        let record = TrainingRecord(
            durationInSeconds: nil,
            menuName: "テスト",
            note: "",
            reps: 0,
            satisfaction: "満足",
            sets: 0,
            totalWeight: 0,
            usedItems: []
        )
        
        #expect(throws: DomainError.validation(.invalidDurationValue)) {
            try record.validation(recodType: .timeBase)
        }
    }
    
    @Test("validation: timeBaseで時間が0")
    func testValidationTimeBaseIsZero() throws {
        let record = TrainingRecord(
            durationInSeconds: 0,
            menuName: "テスト",
            note: "",
            reps: 0,
            satisfaction: "満足",
            sets: 0,
            totalWeight: 0,
            usedItems: []
        )
        
        #expect(throws: DomainError.validation(.invalidDurationValue)) {
            try record.validation(recodType: .timeBase)
        }
    }
    
    @Test("validation: timeBaseで満足度が空")
    func testValidationTimeBaseIsSatisfactionEmpty() throws {
        let record = TrainingRecord(
            durationInSeconds: 60,
            menuName: "テスト",
            note: "",
            reps: 0,
            satisfaction: "",
            sets: 0,
            totalWeight: 0,
            usedItems: []
        )
        
        #expect(throws: DomainError.validation(.invalidSatisfaction)) {
            try record.validation(recodType: .timeBase)
        }
    }
    
    @Test("validation: weightBaseでtotalWeightが0")
    func testValidationWeightBaseIsZero() throws {
        let record = TrainingRecord(
            durationInSeconds: nil,
            menuName: "テスト",
            note: "",
            reps: 10,
            satisfaction: "満足",
            sets: 3,
            totalWeight: 0,
            usedItems: []
        )
        
        #expect(throws: DomainError.validation(.invalidWeightValue)) {
            try record.validation(recodType: .weightBase)
        }
    }
    
    @Test("validation: weightBaseでrepsが0")
    func testValidationWeightBaseRepsIsZero() throws {
        let record = TrainingRecord(
            durationInSeconds: nil,
            menuName: "テスト",
            note: "",
            reps: 0,
            satisfaction: "満足",
            sets: 3,
            totalWeight: 100,
            usedItems: []
        )
        
        #expect(throws: DomainError.validation(.invalidWeightValue)) {
            try record.validation(recodType: .weightBase)
        }
    }
    
    @Test("validation: weightBaseでsetsが0")
    func testValidationWeightBaseSetsIsZero() throws {
        let record = TrainingRecord(
            durationInSeconds: nil,
            menuName: "テスト",
            note: "",
            reps: 10,
            satisfaction: "満足",
            sets: 0,
            totalWeight: 100,
            usedItems: []
        )
        
        #expect(throws: DomainError.validation(.invalidWeightValue)) {
            try record.validation(recodType: .weightBase)
        }
    }
    
    @Test("validation: weightBaseで満足度が空")
    func testValidationWeightBaseIsSatisfactionEmpty() throws {
        let record = TrainingRecord(
            durationInSeconds: nil,
            menuName: "テスト",
            note: "",
            reps: 10,
            satisfaction: "",
            sets: 3,
            totalWeight: 100,
            usedItems: []
        )
        
        #expect(throws: DomainError.validation(.invalidSatisfaction)) {
            try record.validation(recodType: .weightBase)
        }
    }
}
