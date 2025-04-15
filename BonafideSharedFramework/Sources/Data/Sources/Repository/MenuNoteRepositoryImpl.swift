//
//  MenuNoteRepositoryImpl.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct MenuNoteRepositoryImpl: MenuNoteRepository {
    private let firebaseDataStore: FirebaseDataStore
    
    public init(firebaseDataStore: FirebaseDataStore) {
        self.firebaseDataStore = firebaseDataStore
    }
    
    public func register(userId: String, menuNote: MenuNote) async throws(DomainError) {
        do {
            try await firebaseDataStore.registerMenuNote(userId: userId, menuNoteDTO: MenuNoteDTO(from: menuNote))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func delete(userId: String, menuNoteId: String) async throws(DomainError) {
        do {
            try await firebaseDataStore.deleteMenuNote(userId: userId, menuNoteId: menuNoteId)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func update(userId: String, menuNote: MenuNote) async throws(DomainError) {
        do {
            try await firebaseDataStore.updateMenuNote(userId: userId, menuNoteDTO: MenuNoteDTO(from: menuNote))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll(userId: String) async throws(DomainError) -> [MenuNote] {
        do {
            return try await firebaseDataStore.fetchAllMenuNote(userId: userId).map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
}
