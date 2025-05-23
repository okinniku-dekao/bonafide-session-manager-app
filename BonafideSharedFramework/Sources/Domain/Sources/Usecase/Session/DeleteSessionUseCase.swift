//
//  DeleteSessionUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol DeleteSessionUseCase: Sendable{
    func callAsFunction(userId: String, sessionIds: [String]) async throws(DomainError)
}
