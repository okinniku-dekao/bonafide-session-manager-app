//
//  FetchMenuDetailUseCaseImpl.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/24.
//

import Domain

public struct FetchMenuDetailUseCaseImpl: FetchMenuDetailUseCase {
    private let menuRepository: MenuRepository
    
    public init(menuRepository: MenuRepository) {
        self.menuRepository = menuRepository
    }
    
    public func callAsFunction(by menuName: String) async throws(DomainError) -> Menu {
        guard let menu = try await menuRepository.fetchAll().first(where: { $0.name == menuName }) else {
            throw DomainError.notFound
        }
        return menu
    }
}
