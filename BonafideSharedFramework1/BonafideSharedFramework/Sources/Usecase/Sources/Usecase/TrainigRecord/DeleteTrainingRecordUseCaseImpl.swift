//
//  DeleteTrainingRecordUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct DeleteTrainingRecordUseCaseImpl: DeleteTrainingRecordUseCase {
    private let trainingRecordRepository: TrainingRecordRepository
    
    public init(trainingRecordRepository: TrainingRecordRepository) {
        self.trainingRecordRepository = trainingRecordRepository
    }
    
    public func callAsFunction(userId: String, recordId: String) async throws(DomainError) {
        try await trainingRecordRepository.delete(userId: userId, trainingRecordId: recordId)
    }
}
