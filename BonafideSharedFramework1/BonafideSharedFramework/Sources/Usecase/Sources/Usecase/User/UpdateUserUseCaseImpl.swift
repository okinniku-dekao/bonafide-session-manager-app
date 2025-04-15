//
//  UpdateUserUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Domain

public struct UpdateUserUseCaseImpl: UpdateUserUseCase {
    private let userRepository: UserRepository
    
    public init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    public func callAsFunction(_ user: User) async throws(DomainError) {
        try await userRepository.update(user)
    }
}
