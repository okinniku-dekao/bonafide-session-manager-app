//
//  RegisterWeightUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol RegisterWeightUseCase: Sendable {
    func callAsFunction(_ weight: Weight) async throws(DomainError)
}
