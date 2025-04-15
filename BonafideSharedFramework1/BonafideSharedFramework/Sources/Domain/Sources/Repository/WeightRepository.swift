//
//  WeightRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol WeightRepository: Sendable {
    func register(_ weight: Weight) async throws(DomainError)
    func delete(_ weightId: String) async throws(DomainError)
    func update(_ weight: Weight) async throws(DomainError)
    func fetchAll() async throws(DomainError) -> [Weight]
}
