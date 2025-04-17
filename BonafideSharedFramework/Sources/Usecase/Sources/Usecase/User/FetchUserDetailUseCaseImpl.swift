//
//  FetchUserDetailUseCaseImpl.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/17.
//

import Domain

public struct FetchUserDetailUseCaseImpl: FetchUserDetailUseCase {
    private let userRepository: UserRepository
    
    public init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    public func callAsFunction(_ userId: String) async throws(DomainError) -> User {
        let users = try await userRepository.fetchAll()
        guard let user = users.first(where: { $0.id == userId }) else {
            throw .notFound
        }
        return user
    }
}
