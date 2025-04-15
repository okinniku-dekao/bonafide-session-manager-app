//
//  TrainingRecordRepositoryImpl.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct TrainingRecordRepositoryImpl: TrainingRecordRepository {
    private let firebaseDataStore: FirebaseDataStore
    
    public init(firebaseDataStore: FirebaseDataStore) {
        self.firebaseDataStore = firebaseDataStore
    }
    
    public func register(userId: String, trainingRecord: TrainingRecord) async throws(DomainError) {
        do {
            try await firebaseDataStore.registerTrainingRecord(
                userId: userId,
                trainingRecordDTO: TrainingRecordDTO(from: trainingRecord)
            )
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func delete(userId: String, trainingRecordId: String) async throws(DomainError) {
        do {
            try await firebaseDataStore.deleteTrainingRecord(
                userId: userId,
                trainingRecordId: trainingRecordId
            )
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll(_ userId: String) async throws(DomainError) -> [TrainingRecord] {
        do {
            return try await firebaseDataStore.fetchAllTrainingRecord(userId: userId)
                .map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
}
