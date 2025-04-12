//
//  MenuNoteRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol MenuNoteRepository {
    func register(_ menuNote: MenuNote) async throws(DomainError)
    func delete(_ menuNoteId: String) async throws(DomainError)
    func update(_ menuNote: MenuNote) async throws(DomainError)
    func fetchAll() async throws(DomainError) -> [MenuNote]
}
