//
//  UpdateMenuNoteUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct UpdateMenuNoteUseCaseImpl: UpdateMenuNoteUseCase {
    private let menuNoteRepository: MenuNoteRepository
    
    public init(menuNoteRepository: MenuNoteRepository) {
        self.menuNoteRepository = menuNoteRepository
    }
    
    public func callAsFunction(userId: String, menuNote: MenuNote) async throws(DomainError) {
        try await menuNoteRepository.update(userId: userId, menuNote: menuNote)
    }
}
