//
//  RegisterSessionUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct RegisterSessionUseCaseImpl: RegisterSessionUseCase {
    private let sessionRepository: SessionRepository
    
    public init(sessionRepository: SessionRepository) {
        self.sessionRepository = sessionRepository
    }
    
    public func callAsFunction(userId: String, sessions: [Session]) async throws(DomainError) {
        try await sessionRepository.register(userId: userId, sessions: sessions)
    }
}
