//
//  StreamSessionsUseCaseImpl.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import Domain

public struct StreamSessionsUseCaseImpl: StreamSessionsUseCase {
    private let sessionRepository: SessionRepository
    
    public init(sessionRepository: SessionRepository) {
        self.sessionRepository = sessionRepository
    }
    
    public func callAsFunction(userId: String) async -> AsyncThrowingStream<[Session], any Error> {
        await sessionRepository.streamSessions(userId: userId)
    }
}
