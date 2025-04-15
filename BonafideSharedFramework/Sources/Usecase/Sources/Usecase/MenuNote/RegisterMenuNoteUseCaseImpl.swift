//
//  RegisterMenuNoteUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct RegisterMenuNoteUseCaseImpl: RegisterMenuNoteUseCase {
    private let menuNoteRepository: MenuNoteRepository
    
    public init(menuNoteRepository: MenuNoteRepository) {
        self.menuNoteRepository = menuNoteRepository
    }
    
    public func callAsFunction(userId: String, menuNote: MenuNote) async throws(DomainError) {
        try await menuNoteRepository.register(userId: userId, menuNote: menuNote)
    }
}
