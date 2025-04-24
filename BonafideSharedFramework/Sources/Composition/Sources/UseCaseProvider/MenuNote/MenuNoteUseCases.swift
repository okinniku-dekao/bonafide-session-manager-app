//
//  MenuNoteUseCases.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Dependencies
import Domain
import Usecase
import Data
import Infrastructure

public struct MenuNoteUseCases: Sendable {
    public var delete: any DeleteMenuNoteUseCase
    public var fetchAll: any FetchAllMenuNoteUseCase
    public var register: any RegisterMenuNoteUseCase
    public var update: any UpdateMenuNoteUseCase
}

public extension DependencyValues {
    var menuNoteUseCases: MenuNoteUseCases {
        get { self[MenuNoteUseCases.self] }
        set { self[MenuNoteUseCases.self] = newValue }
    }
}

extension MenuNoteUseCases: DependencyKey {
    private static let firebaseDataSourceImpl: FirebaseDataSource = FirebaseDataSourceImpl()
    private static let menuNoteRepositoryImpl: MenuNoteRepository = MenuNoteRepositoryImpl(firebaseDataSource: firebaseDataSourceImpl)

    public static var liveValue: MenuNoteUseCases {
        Self(
            delete: DeleteMenuNoteUseCaseImpl(menuNoteRepository: menuNoteRepositoryImpl),
            fetchAll: FetchAllMenuNoteUseCaseImpl(menuNoteRepository: menuNoteRepositoryImpl),
            register: RegisterMenuNoteUseCaseImpl(menuNoteRepository: menuNoteRepositoryImpl),
            update: UpdateMenuNoteUseCaseImpl(menuNoteRepository: menuNoteRepositoryImpl)
        )
    }
    
    public static var testValue: MenuNoteUseCases {
        Self(
            delete: UnimplementedDeleteMenuNoteUseCase(),
            fetchAll: UnimplementedFetchAllMenuNoteUserCase(),
            register: UnimplementedRegisterMenuNoteUseCase(),
            update: UnimplementedUpdateMenuNoteUseCase()
        )
    }
}
