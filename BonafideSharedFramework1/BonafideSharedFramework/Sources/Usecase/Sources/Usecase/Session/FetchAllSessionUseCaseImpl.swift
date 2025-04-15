//
//  FetchAllSessionUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct FetchAllSessionUseCaseImpl: FetchAllSessionUseCase {
    private let sessionRepository: SessionRepository
    
    public init(sessionRepository: SessionRepository) {
        self.sessionRepository = sessionRepository
    }
    
    public func callAsFunction(userId: String) async throws(DomainError) -> [Session] {
        try await sessionRepository.fetchAll(userId: userId)
    }
}
