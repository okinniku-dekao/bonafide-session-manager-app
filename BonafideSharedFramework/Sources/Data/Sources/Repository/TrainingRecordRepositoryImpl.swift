//
//  TrainingRecordRepositoryImpl.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct TrainingRecordRepositoryImpl: TrainingRecordRepository {
    private let firebaseDataSource: FirebaseDataSource
    
    public init(firebaseDataSource: FirebaseDataSource) {
        self.firebaseDataSource = firebaseDataSource
    }
    
    public func register(userId: String, trainingRecord: TrainingRecord) async throws(DomainError) {
        do {
            try await firebaseDataSource.registerTrainingRecord(
                userId: userId,
                trainingRecordDTO: TrainingRecordDTO(from: trainingRecord)
            )
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func delete(userId: String, trainingRecordId: String) async throws(DomainError) {
        do {
            try await firebaseDataSource.deleteTrainingRecord(
                userId: userId,
                trainingRecordId: trainingRecordId
            )
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll(_ userId: String) async throws(DomainError) -> [TrainingRecord] {
        do {
            return try await firebaseDataSource.fetchAllTrainingRecord(userId: userId)
                .map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
}
