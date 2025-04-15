//
//  UpdateMenuUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Domain

public struct UpdateMenuUseCaseImpl: UpdateMenuUseCase {
    private let menuRepository: MenuRepository
    
    public init(menuRepository: MenuRepository) {
        self.menuRepository = menuRepository
    }
    
    public func callAsFunction(_ menu: Menu) async throws(DomainError) {
        try await menuRepository.update(menu)
    }
}
