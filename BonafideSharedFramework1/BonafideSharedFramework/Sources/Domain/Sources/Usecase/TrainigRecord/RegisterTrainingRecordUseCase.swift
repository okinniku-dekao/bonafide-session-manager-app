//
//  RegisterTrainingRecordUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol RegisterTrainingRecordUseCase: Sendable {
    func callAsFunction(userId: String, trainingRecord: TrainingRecord, recordType: RecordType) async throws(DomainError)
}
