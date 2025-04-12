//
//  UpdateMenuNoteUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol UpdateMenuNoteUseCase {
    func callAsFunction(_ menuNote: MenuNote) async throws(DomainError)
}
