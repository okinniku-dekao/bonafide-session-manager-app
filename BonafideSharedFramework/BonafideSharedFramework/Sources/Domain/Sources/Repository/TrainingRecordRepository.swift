//
//  TrainingRecordRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol TrainingRecordRepository {
    func register(_ trainingRecord: TrainingRecord) async throws
    func delete(userId: String, trainingRecordId: String) async throws
    func fetchAll(_ userId: String) async throws -> [TrainingRecord]
}
