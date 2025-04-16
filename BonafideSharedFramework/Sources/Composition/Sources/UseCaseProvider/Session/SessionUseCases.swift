//
//  SessionUseCases.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Dependencies
import Domain
import Usecase
import Data
import Infrastructure

public struct SessionUseCases: Sendable {
    public var delete: any DeleteSessionUseCase
    public var fetchAll: any FetchAllSessionUseCase
    public var register: any RegisterSessionUseCase
    public var stream: any StreamSessionsUseCase
}

public extension DependencyValues {
    var sessionUseCases: SessionUseCases {
        get { self[SessionUseCases.self] }
        set { self[SessionUseCases.self] = newValue }
    }
}

extension SessionUseCases: DependencyKey {
    private static let firebaseDataStoreImpl: FirebaseDataStore = FirebaseDataStoreImpl()
    private static let sessionRepositoryImpl: SessionRepository = SessionRepositoryImpl(firebaseDataStore: firebaseDataStoreImpl)

    public static var liveValue: SessionUseCases {
        Self(
            delete: DeleteSessionUseCaseImpl(sessionRepository: sessionRepositoryImpl),
            fetchAll: FetchAllSessionUseCaseImpl(sessionRepository: sessionRepositoryImpl),
            register: RegisterSessionUseCaseImpl(sessionRepository: sessionRepositoryImpl),
            stream: StreamSessionsUseCaseImpl(sessionRepository: sessionRepositoryImpl)
        )
    }
    
    public static var testValue: SessionUseCases {
        Self(
            delete: UnimplementedDeleteSessionUseCase(),
            fetchAll: UnimplementedFetchAllSessionUserCase(),
            register: UnimplementedRegisterSessionUseCase(),
            stream: UnimplementedStreamSessionsUseCase()
        )
    }
}
