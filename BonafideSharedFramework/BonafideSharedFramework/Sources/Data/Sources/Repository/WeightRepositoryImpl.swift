//
//  WeightRepositoryImpl.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct WeightRepositoryImpl: WeightRepository {
    private let firebaseDataStore: FirebaseDataStore
    
    public init(firebaseDataStore: FirebaseDataStore) {
        self.firebaseDataStore = firebaseDataStore
    }
    
    public func register(_ weight: Weight) async throws(DomainError) {
        do {
            try await firebaseDataStore.registerWeight(weightDTO: WeightDTO(from: weight))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func delete(_ weightId: String) async throws(DomainError) {
        do {
            try await firebaseDataStore.deleteWeight(weightId: weightId)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func update(_ weight: Weight) async throws(DomainError) {
        do {
            try await firebaseDataStore.updateWeight(weightDTO: WeightDTO(from: weight))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll() async throws(DomainError) -> [Weight] {
        do {
            return try await firebaseDataStore.fetchAllWeight()
                .map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
}
