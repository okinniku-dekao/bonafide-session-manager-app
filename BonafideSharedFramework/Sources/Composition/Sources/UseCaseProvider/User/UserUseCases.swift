//
//  UserUseCases.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Dependencies
import Domain
import Usecase
import Data
import Infrastructure

public struct UserUseCases: Sendable {
    public var delete: any DeleteUserUseCase
    public var fetchAll: any FetchAllUserUseCase
    public var register: any RegisterUserUseCase
    public var update: any UpdateUserUseCase
    public var fetchDetail: any FetchUserDetailUseCase
}

public extension DependencyValues {
    var userUseCases: UserUseCases {
        get { self[UserUseCases.self] }
        set { self[UserUseCases.self] = newValue }
    }
}

extension UserUseCases: DependencyKey {
    private static let firebaseDataStoreImpl: FirebaseDataStore = FirebaseDataStoreImpl()
    private static let userRepositoryImpl: UserRepository = UserRepositoryImpl(firebaseDataStore: firebaseDataStoreImpl)

    public static var liveValue: UserUseCases {
        Self(
            delete: DeleteUserUseCaseImpl(userRepository: userRepositoryImpl),
            fetchAll: FetchAllUserUseCaseImpl(userRepository: userRepositoryImpl),
            register: RegisterUserUseCaseImpl(userRepository: userRepositoryImpl),
            update: UpdateUserUseCaseImpl(userRepository: userRepositoryImpl),
            fetchDetail: FetchUserDetailUseCaseImpl(userRepository: userRepositoryImpl)
        )
    }
    
    public static var testValue: UserUseCases {
        Self(
            delete: UnimplementedDeleteUserUseCase(),
            fetchAll: UnimplementedFetchAllUserCase(),
            register: UnimplementedRegisterUserUseCase(),
            update: UnimplementedUpdateUserUseCase(),
            fetchDetail: UnimplementedFetchUserDetailUseCase()
        )
    }
}
