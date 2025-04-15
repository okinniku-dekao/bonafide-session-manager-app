//
//  DeleteSessionUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct DeleteSessionUseCaseImpl: DeleteSessionUseCase {
    private let sessionRepository: SessionRepository
    
    public init(sessionRepository: SessionRepository) {
        self.sessionRepository = sessionRepository
    }
    
    public func callAsFunction(userId: String, sessionIds: [String]) async throws(DomainError) {
        try await sessionRepository.delete(userId: userId, sessionIds: sessionIds)
    }
}
