//
//  FetchAllTrainingRecordUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol FetchAllTrainingRecordUseCase {
    func callAsFunction(_ userId: String) async throws -> [TrainingRecord]
}