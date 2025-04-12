//
//  UpdateUserUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol UpdateUserUseCase {
    func callAsFunction(_ user: User) async throws(DomainError)
}
