//
//  UnimplementedSession.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Domain

struct UnimplementedDeleteSessionUseCase: DeleteSessionUseCase {
    func callAsFunction(userId: String, sessionIds: [String]) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedFetchAllSessionUserCase: FetchAllSessionUseCase {
    func callAsFunction(userId: String) async throws(DomainError) -> [Session] {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedRegisterSessionUseCase: RegisterSessionUseCase {
    func callAsFunction(userId: String, sessions: [Session]) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}
