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
    
    public func callAsFunction(userId: String) -> AsyncThrowingStream<[Session], any Error> {
        sessionRepository.streamSessions(userId: userId)
    }
}
