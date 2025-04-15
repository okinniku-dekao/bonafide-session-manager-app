//
//  FetchAllMenuNoteUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct FetchAllMenuNoteUseCaseImpl: FetchAllMenuNoteUseCase {
    private let menuNoteRepository: MenuNoteRepository
    
    public init(menuNoteRepository: MenuNoteRepository) {
        self.menuNoteRepository = menuNoteRepository
    }
    
    public func callAsFunction(userId: String) async throws(DomainError) -> [MenuNote] {
        try await menuNoteRepository.fetchAll(userId: userId)
    }
}
