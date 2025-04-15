//
//  FetchAllWeightUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol FetchAllWeightUseCase: Sendable {
    func callAsFunction() async throws(DomainError) -> [Weight]
}
