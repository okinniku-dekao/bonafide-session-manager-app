//
//  UpdateWeightUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct UpdateWeightUseCaseImpl: UpdateWeightUseCase {
    private let weightRepository: WeightRepository
    
    public init(weightRepository: WeightRepository) {
        self.weightRepository = weightRepository
    }
    
    public func callAsFunction(_ weight: Weight) async throws(DomainError) {
        try await weightRepository.update(weight)
    }
}
