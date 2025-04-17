//
//  FetchUserDetailUseCase.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/17.
//

public protocol FetchUserDetailUseCase: Sendable {
    func callAsFunction(_ userId: String) async throws(DomainError) -> User
}
