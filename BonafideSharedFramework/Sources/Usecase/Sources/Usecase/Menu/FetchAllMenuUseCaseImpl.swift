//
//  FetchAllMenuUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Domain

public struct FetchAllMenuUseCaseImpl: FetchAllMenuUseCase {
    private let menuRepository: MenuRepository
    
    public init(menuRepository: MenuRepository) {
        self.menuRepository = menuRepository
    }

    public func callAsFunction() async throws(DomainError) -> [Menu] {
        try await menuRepository.fetchAll()
    }
}
