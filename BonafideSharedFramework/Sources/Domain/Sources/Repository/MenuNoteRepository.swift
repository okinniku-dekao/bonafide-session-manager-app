//
//  MenuNoteRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol MenuNoteRepository: Sendable {
    func register(userId: String, menuNote: MenuNote) async throws(DomainError)
    func delete(userId: String, menuNoteId: String) async throws(DomainError)
    func update(userId: String, menuNote: MenuNote) async throws(DomainError)
    func fetchAll(userId: String) async throws(DomainError) -> [MenuNote]
}
