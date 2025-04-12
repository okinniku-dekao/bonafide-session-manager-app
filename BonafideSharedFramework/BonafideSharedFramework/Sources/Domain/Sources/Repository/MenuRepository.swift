//
//  MenuRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol MenuRepository {
    func register(_ menu: Menu) async throws
    func update(_ menu: Menu) async throws
    func delete(_ menuId: String) async throws
    func fetchAll() async throws -> [Menu]
}