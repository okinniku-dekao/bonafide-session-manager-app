//
//  FetchAllSessionUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol FetchAllSessionUseCase {
    func callAsFunction(userId: String) async throws(DomainError) -> [Session]
}
