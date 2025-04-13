//
//  RegisterMenuNoteUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol RegisterMenuNoteUseCase {
    func callAsFunction(userId: String, menuNote: MenuNote) async throws(DomainError)
}
