//
//  DeleteWeightUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol DeleteWeightUseCase {
    func callAsFunction(_ weightId: String) async throws
}