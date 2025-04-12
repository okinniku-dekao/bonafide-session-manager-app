//
//  UserRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol UserRepository {
    func register(_ user: User) async throws
    func update(_ user: User) async throws
    func delete(_ userId: String) async throws
    func fetchAll() async throws -> [User]
    func fetchAll(for store: Store) async throws -> [User]
}
