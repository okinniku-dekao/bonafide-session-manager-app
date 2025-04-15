//
//  RegisterMenuUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol RegisterMenuUseCase: Sendable {
    func callAsFunction(_ menu: Menu) async throws(DomainError)
}
