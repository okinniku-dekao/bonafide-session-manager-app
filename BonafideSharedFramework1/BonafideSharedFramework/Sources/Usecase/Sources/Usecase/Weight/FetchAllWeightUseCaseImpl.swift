//
//  FetchAllWeightUseCaseImpl.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public struct FetchAllWeightUseCaseImpl: FetchAllWeightUseCase {
    private let weightRepository: WeightRepository
    
    public init(weightRepository: WeightRepository) {
        self.weightRepository = weightRepository
    }
    
    public func callAsFunction() async throws(DomainError) -> [Weight] {
        try await weightRepository.fetchAll()
    }
}
