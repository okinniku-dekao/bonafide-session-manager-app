//
//  WeightRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public protocol WeightRepository {
    func register(_ weight: Weight) async throws
    func delete(_ weightId: String) async throws
    func update(_ weight: Weight) async throws
    func fetchAll() async throws -> [Weight]
}