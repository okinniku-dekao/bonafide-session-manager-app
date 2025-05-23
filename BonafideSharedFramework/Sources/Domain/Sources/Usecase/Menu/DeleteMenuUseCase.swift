//
//  DeleteMenuUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol DeleteMenuUseCase: Sendable {
    func callAsFunction(_ menuId: String) async throws(DomainError)
}
