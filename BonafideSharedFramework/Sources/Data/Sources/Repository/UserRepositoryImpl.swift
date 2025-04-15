//
//  UserRepositoryImpl.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct UserRepositoryImpl: UserRepository {
    private let firebaseDataStore: FirebaseDataStore
    
    public init(firebaseDataStore: FirebaseDataStore) {
        self.firebaseDataStore = firebaseDataStore
    }
    
    public func register(_ user: User) async throws(DomainError) {
        do {
            try await firebaseDataStore.registerUser(userDTO: UserDTO(from: user))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func update(_ user: User) async throws(DomainError) {
        do {
            try await firebaseDataStore.updateUser(userDTO: UserDTO(from: user))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func delete(_ userId: String) async throws(DomainError) {
        do {
            try await firebaseDataStore.deleteUser(userId: userId)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll() async throws(DomainError) -> [User] {
        do {
            return try await firebaseDataStore.fetchAllUser()
                .map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll(for store: Store) async throws(DomainError) -> [User] {
        do {
            let storeDTO = StoreDTO(from: store)
            return try await firebaseDataStore.fetchAllUser()
                .filter { $0.store == storeDTO }
                .map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
}
