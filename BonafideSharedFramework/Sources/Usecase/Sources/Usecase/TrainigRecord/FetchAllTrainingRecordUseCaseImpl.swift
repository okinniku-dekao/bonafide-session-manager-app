//
//  FetchAllTrainingRecordUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct FetchAllTrainingRecordUseCaseImpl: FetchAllTrainingRecordUseCase {
    private let trainingRecordRepository: TrainingRecordRepository
    
    public init(trainingRecordRepository: TrainingRecordRepository) {
        self.trainingRecordRepository = trainingRecordRepository
    }
    
    public func callAsFunction(_ userId: String) async throws(DomainError) -> [TrainingRecord] {
        try await trainingRecordRepository.fetchAll(userId)
    }
}
