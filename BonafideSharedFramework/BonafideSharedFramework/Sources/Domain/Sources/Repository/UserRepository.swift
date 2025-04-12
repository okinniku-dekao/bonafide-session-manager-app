//
//  UserRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol UserRepository {
    func register(user: User) async throws
    func update(user: User) async throws
    func delete(userId: String) async throws
    func fetchAll() async throws -> [User]
}
