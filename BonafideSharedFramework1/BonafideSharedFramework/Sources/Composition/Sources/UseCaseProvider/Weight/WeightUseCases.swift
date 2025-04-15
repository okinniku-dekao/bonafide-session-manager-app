//
//  WeightUseCases.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Dependencies
import Domain
import Usecase
import Data
import Infrastructure

public struct WeightUseCases: Sendable {
    public var delete: any DeleteWeightUseCase
    public var fetchAll: any FetchAllWeightUseCase
    public var register: any RegisterWeightUseCase
    public var update: any UpdateWeightUseCase
}

public extension DependencyValues {
    var weightUseCases: WeightUseCases {
        get { self[WeightUseCases.self] }
        set { self[WeightUseCases.self] = newValue }
    }
}

extension WeightUseCases: DependencyKey {
    private static let firebaseDataStoreImpl: FirebaseDataStore = FirebaseDataStoreImpl()
    private static let weightRepositoryImpl: WeightRepository = WeightRepositoryImpl(firebaseDataStore: firebaseDataStoreImpl)

    public static var liveValue: WeightUseCases {
        Self(
            delete: DeleteWeightUseCaseImpl(weightRepository: weightRepositoryImpl),
            fetchAll: FetchAllWeightUseCaseImpl(weightRepository: weightRepositoryImpl),
            register: RegisterWeightUseCaseImpl(weightRepository: weightRepositoryImpl),
            update: UpdateWeightUseCaseImpl(weightRepository: weightRepositoryImpl)
        )
    }
    
    public static var testValue: WeightUseCases {
        Self(
            delete: UnimplementedDeleteWeightUseCase(),
            fetchAll: UnimplementedFetchAllWeightCase(),
            register: UnimplementedRegisterWeightUseCase(),
            update: UnimplementedUpdateWeightUseCase()
        )
    }
}
