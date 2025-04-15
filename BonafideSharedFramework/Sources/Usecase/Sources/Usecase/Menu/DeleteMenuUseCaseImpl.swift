//
//  DeleteMenuUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//

import Domain

public struct DeleteMenuUseCaseImpl: DeleteMenuUseCase {
    private let menuRepository: MenuRepository
    
    public init(menuRepository: MenuRepository) {
        self.menuRepository = menuRepository
    }
    
    public func callAsFunction(_ menuId: String) async throws (DomainError) {
        try await menuRepository.delete(menuId)
    }
}
