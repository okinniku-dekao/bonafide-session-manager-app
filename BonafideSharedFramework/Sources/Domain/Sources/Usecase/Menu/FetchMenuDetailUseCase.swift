//
//  FetchMenuDetailUseCase.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/24.
//

public protocol FetchMenuDetailUseCase: Sendable {
    func callAsFunction(by menuName: String) async throws(DomainError) -> Menu
}
