//
//  FetchAllUserUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol FetchAllUserUseCase: Sendable {
    func callAsFunction(for store: Store?) async throws(DomainError) -> [User]
}
