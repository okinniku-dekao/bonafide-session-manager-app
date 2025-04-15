//
//  DeleteTrainingRecordUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol DeleteTrainingRecordUseCase: Sendable {
    func callAsFunction(userId: String, recordId: String) async throws(DomainError)
}
