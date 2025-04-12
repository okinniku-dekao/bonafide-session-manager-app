//
//  SessionRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol SessionRepository {
    func register(userId: String, sessions: [Session]) async throws(DomainError)
    func delete(userId: String, sessionIds: [String]) async throws(DomainError)
    func fetchAll(userId: String) async throws(DomainError) -> [Session]
}
