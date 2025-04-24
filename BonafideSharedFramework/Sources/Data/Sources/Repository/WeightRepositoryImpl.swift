//
//  WeightRepositoryImpl.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct WeightRepositoryImpl: WeightRepository {
    private let firebaseDataSource: FirebaseDataSource
    
    public init(firebaseDataSource: FirebaseDataSource) {
        self.firebaseDataSource = firebaseDataSource
    }
    
    public func register(_ weight: Weight) async throws(DomainError) {
        do {
            try await firebaseDataSource.registerWeight(weightDTO: WeightDTO(from: weight))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func delete(_ weightId: String) async throws(DomainError) {
        do {
            try await firebaseDataSource.deleteWeight(weightId: weightId)
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func update(_ weight: Weight) async throws(DomainError) {
        do {
            try await firebaseDataSource.updateWeight(weightDTO: WeightDTO(from: weight))
        } catch {
            throw DomainError(from: error)
        }
    }
    
    public func fetchAll() async throws(DomainError) -> [Weight] {
        do {
            return try await firebaseDataSource.fetchAllWeight()
                .map(\.toDomain)
        } catch {
            throw DomainError(from: error)
        }
    }
}
