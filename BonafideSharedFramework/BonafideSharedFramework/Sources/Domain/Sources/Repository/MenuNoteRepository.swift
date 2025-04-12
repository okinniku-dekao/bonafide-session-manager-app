//
//  MenuNoteRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol MenuNoteRepository {
    func register(_ menuNote: MenuNote) async throws
    func delete(_ menuNoteId: String) async throws
    func update(_ menuNote: MenuNote) async throws
    func fetchAll() async throws -> [MenuNote]
}
