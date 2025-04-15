//
//  MenuRepositoryImpl.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct MenuRepositoryImpl: MenuRepository {
    private let firebaseDataStore: FirebaseDataStore
    
    public init(firebaseDataStore: FirebaseDataStore) {
        self.firebaseDataStore = firebaseDataStore
    }
    
    public func register(_ menu: Menu) async throws(DomainError) {
        do {
            try await firebaseDataStore.registerMenu(MenuDTO(from: menu))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func update(_ menu: Menu) async throws(DomainError) {
        do {
            try await firebaseDataStore.updateMenu(MenuDTO(from: menu))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func delete(_ menuId: String) async throws(DomainError) {
        do {
            try await firebaseDataStore.deleteMenu(menuId: menuId)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll() async throws(DomainError) -> [Menu] {
        do {
            return try await firebaseDataStore.fetchAllMenu().map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
}
