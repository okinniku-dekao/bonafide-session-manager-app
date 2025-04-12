//
//  FetchAllUsersUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol FetchAllUsersUseCase {
    func callAsFunction() async throws -> [User]
}
