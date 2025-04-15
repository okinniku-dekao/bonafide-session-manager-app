//
//  FetchAllUserUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Domain

public final class FetchAllUserUseCaseImpl: FetchAllUserUseCase {
    private let userRepository: UserRepository
    
    public init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    public func callAsFunction(for store: Store?) async throws(DomainError) -> [User] {
        if let store {
            return try await userRepository.fetchAll(for: store)
        }
        return try await userRepository.fetchAll()
    }
}
