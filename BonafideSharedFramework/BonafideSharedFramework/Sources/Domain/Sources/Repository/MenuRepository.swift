//
//  MenuRepository.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol MenuRepository {
    func register(_ menu: Menu) async throws(DomainError)
    func update(_ menu: Menu) async throws(DomainError)
    func delete(_ menuId: String) async throws(DomainError)
    func fetchAll() async throws(DomainError) -> [Menu]
}
