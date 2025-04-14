//
//  FetchAllTrainingRecordUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol FetchAllTrainingRecordUseCase: Sendable {
    func callAsFunction(_ userId: String) async throws(DomainError) -> [TrainingRecord]
}
