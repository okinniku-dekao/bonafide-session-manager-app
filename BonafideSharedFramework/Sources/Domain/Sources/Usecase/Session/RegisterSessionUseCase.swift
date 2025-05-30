//
//  RegisterSessionUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol RegisterSessionUseCase: Sendable {
    func callAsFunction(userId: String, sessions: [Session]) async throws(DomainError)
}
