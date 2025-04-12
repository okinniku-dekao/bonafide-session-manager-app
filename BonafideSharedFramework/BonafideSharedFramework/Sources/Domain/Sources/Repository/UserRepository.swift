//
//  UserRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol UserRepository {
    func register(_ user: User) async throws(DomainError)
    func update(_ user: User) async throws(DomainError)
    func delete(_ userId: String) async throws(DomainError)
    func fetchAll() async throws(DomainError) -> [User]
    func fetchAll(for store: Store) async throws(DomainError) -> [User]
}
