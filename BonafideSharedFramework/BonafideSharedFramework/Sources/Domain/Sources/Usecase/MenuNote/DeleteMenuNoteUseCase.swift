//
//  DeleteMenuNoteUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol DeleteMenuNoteUseCase {
    func callAsFunction(_ menuNoteId: String) async throws(DomainError)
}
