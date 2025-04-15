//
//  DeleteMenuNoteUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct DeleteMenuNoteUseCaseImpl: DeleteMenuNoteUseCase {
    private let menuNoteRepository: MenuNoteRepository
    
    public init(menuNoteRepository: MenuNoteRepository) {
        self.menuNoteRepository = menuNoteRepository
    }
    
    public func callAsFunction(userId: String, menuNoteId: String) async throws(DomainError) {
        try await menuNoteRepository.delete(userId: userId, menuNoteId: menuNoteId)
    }
}
