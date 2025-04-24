//
//  MenuRepositoryImpl.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct MenuRepositoryImpl: MenuRepository {
    private let firebaseDataSource: FirebaseDataSource
    
    public init(firebaseDataSource: FirebaseDataSource) {
        self.firebaseDataSource = firebaseDataSource
    }
    
    public func register(_ menu: Menu) async throws(DomainError) {
        do {
            try await firebaseDataSource.registerMenu(MenuDTO(from: menu))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func update(_ menu: Menu) async throws(DomainError) {
        do {
            try await firebaseDataSource.updateMenu(MenuDTO(from: menu))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func delete(_ menuId: String) async throws(DomainError) {
        do {
            try await firebaseDataSource.deleteMenu(menuId: menuId)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll() async throws(DomainError) -> [Menu] {
        do {
            return try await firebaseDataSource.fetchAllMenu().map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
}
