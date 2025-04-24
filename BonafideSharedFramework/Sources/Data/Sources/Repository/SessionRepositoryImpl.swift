//
//  SessionRepositoryImpl.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct SessionRepositoryImpl: SessionRepository {
    private let firebaseDataSource: FirebaseDataSource
    
    public init(firebaseDataSource: FirebaseDataSource) {
        self.firebaseDataSource = firebaseDataSource
    }
    
    public func register(userId: String, sessions: [Session]) async throws(DomainError) {
        do {
            try await firebaseDataSource.registerSession(userId: userId, sessionDTO: sessions.map { .init(from: $0) })
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func delete(userId: String, sessionIds: [String]) async throws(DomainError) {
        do {
            try await firebaseDataSource.deleteSession(userId: userId, sessionIds: sessionIds)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll(userId: String) async throws(DomainError) -> [Session] {
        do {
            return try await firebaseDataSource.fetchAllSession(userId: userId).map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func streamSessions(userId: String) async -> AsyncThrowingStream<[Session], any Error> {
        await firebaseDataSource.streamAllSession(userId: userId)
            .mapStream {
                $0.map(\.toDomain)
            }
    }
}
