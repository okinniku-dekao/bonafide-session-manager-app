//
//  DeleteUserUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol DeleteUserUseCase {
    func callAsFunction(_ userId: String) async throws
}
