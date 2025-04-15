//
//  UnimplementedMenu.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Domain

struct UnimplementedDeleteMenuUseCase: DeleteMenuUseCase {
    func callAsFunction(_ menuId: String) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedFetchAllMenuUserCase: FetchAllMenuUseCase {
    func callAsFunction() async throws(DomainError) -> [Menu] {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedRegisterMenuUseCase: RegisterMenuUseCase {
    func callAsFunction(_ menu: Menu) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedUpdateMenuUseCase: UpdateMenuUseCase {
    func callAsFunction(_ menu: Menu) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}
