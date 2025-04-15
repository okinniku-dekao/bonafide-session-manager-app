//
//  DeleteMenuNoteUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol DeleteMenuNoteUseCase: Sendable {
    func callAsFunction(userId: String, menuNoteId: String) async throws(DomainError)
}
