//
//  MenuUseCases.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Dependencies
import Domain
import Usecase
import Data
import Infrastructure

public struct MenuUseCases: Sendable {
    public var delete: any DeleteMenuUseCase
    public var fetchAll: any FetchAllMenuUseCase
    public var register: any RegisterMenuUseCase
    public var update: any UpdateMenuUseCase
    public var fetchDetail: any FetchMenuDetailUseCase
}

public extension DependencyValues {
    var menuUseCases: MenuUseCases {
        get { self[MenuUseCases.self] }
        set { self[MenuUseCases.self] = newValue }
    }
}

extension MenuUseCases: DependencyKey {
    private static let firebaseDataSourceImpl: FirebaseDataSource = FirebaseDataSourceImpl()
    private static let menuRepositoryImpl: MenuRepository = MenuRepositoryImpl(firebaseDataSource: firebaseDataSourceImpl)

    public static var liveValue: MenuUseCases {
        Self(
            delete: DeleteMenuUseCaseImpl(menuRepository: menuRepositoryImpl),
            fetchAll: FetchAllMenuUseCaseImpl(menuRepository: menuRepositoryImpl),
            register: RegisterMenuUseCaseImpl(menuRepository: menuRepositoryImpl),
            update: UpdateMenuUseCaseImpl(menuRepository: menuRepositoryImpl),
            fetchDetail: FetchMenuDetailUseCaseImpl(menuRepository: menuRepositoryImpl)
        )
    }
    
    public static var testValue: MenuUseCases {
        Self(
            delete: UnimplementedDeleteMenuUseCase(),
            fetchAll: UnimplementedFetchAllMenuUserCase(),
            register: UnimplementedRegisterMenuUseCase(),
            update: UnimplementedUpdateMenuUseCase(),
            fetchDetail: UnimplementedFetchMenuDetailUseCase()
        )
    }
}
