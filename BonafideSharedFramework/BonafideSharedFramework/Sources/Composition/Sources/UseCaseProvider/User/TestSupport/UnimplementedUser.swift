//
//  UnimplementedUser.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Domain

struct UnimplementedDeleteUserUseCase: DeleteUserUseCase {
    func callAsFunction(_ userId: String) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedFetchAllUserCase: FetchAllUserUseCase {
    func callAsFunction(for store: Store?) async throws(DomainError) -> [User] {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedRegisterUserUseCase: RegisterUserUseCase {
    func callAsFunction(_ user: User) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedUpdateUserUseCase: UpdateUserUseCase {
    func callAsFunction(_ user: User) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}
