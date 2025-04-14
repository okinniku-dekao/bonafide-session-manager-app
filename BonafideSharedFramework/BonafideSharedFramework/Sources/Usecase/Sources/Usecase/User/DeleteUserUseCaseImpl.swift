//
//  DeleteUserUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Domain

public struct DeleteUserUseCaseImpl: DeleteUserUseCase {
    private let userRepository: UserRepository
    
    public init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    public func callAsFunction(_ userId: String) async throws(DomainError) {
        try await userRepository.delete(userId)
    }
}
