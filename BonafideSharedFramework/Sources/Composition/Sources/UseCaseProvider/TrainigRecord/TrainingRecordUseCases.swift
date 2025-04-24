//
//  TrainingRecordUseCases.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Dependencies
import Domain
import Usecase
import Data
import Infrastructure

public struct TrainingRecordUseCases: Sendable {
    public var delete: any DeleteTrainingRecordUseCase
    public var fetchAll: any FetchAllTrainingRecordUseCase
    public var register: any RegisterTrainingRecordUseCase
}

public extension DependencyValues {
    var trainingRecordUseCases: TrainingRecordUseCases {
        get { self[TrainingRecordUseCases.self] }
        set { self[TrainingRecordUseCases.self] = newValue }
    }
}

extension TrainingRecordUseCases: DependencyKey {
    private static let firebaseDataSourceImpl: FirebaseDataSource = FirebaseDataSourceImpl()
    private static let trainingRecordRepositoryImpl: TrainingRecordRepository = TrainingRecordRepositoryImpl(firebaseDataSource: firebaseDataSourceImpl)

    public static var liveValue: TrainingRecordUseCases {
        Self(
            delete: DeleteTrainingRecordUseCaseImpl(trainingRecordRepository: trainingRecordRepositoryImpl),
            fetchAll: FetchAllTrainingRecordUseCaseImpl(trainingRecordRepository: trainingRecordRepositoryImpl),
            register: RegisterTrainingRecordUseCaseImpl(trainingRecordRepository: trainingRecordRepositoryImpl)
        )
    }
    
    public static var testValue: TrainingRecordUseCases {
        Self(
            delete: UnimplementedDeleteTrainingRecordUseCase(),
            fetchAll: UnimplementedFetchAllTrainingRecordCase(),
            register: UnimplementedRegisterTrainingRecordUseCase()
        )
    }
}
