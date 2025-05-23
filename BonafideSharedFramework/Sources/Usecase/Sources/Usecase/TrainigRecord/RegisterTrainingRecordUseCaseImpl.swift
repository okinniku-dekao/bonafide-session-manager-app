//
//  RegisterTrainingRecordUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct RegisterTrainingRecordUseCaseImpl: RegisterTrainingRecordUseCase {
    private let trainingRecordRepository: TrainingRecordRepository
    
    public init(trainingRecordRepository: TrainingRecordRepository) {
        self.trainingRecordRepository = trainingRecordRepository
    }
    
    public func callAsFunction(userId: String, trainingRecord: TrainingRecord, recordType: RecordType) async throws(DomainError) {
        try trainingRecord.validation(recodType: recordType)
        try await trainingRecordRepository.register(userId: userId, trainingRecord: trainingRecord)
    }
}
