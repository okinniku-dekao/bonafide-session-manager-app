//
//  UnimplementedMenuNote.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Domain

struct UnimplementedDeleteMenuNoteUseCase: DeleteMenuNoteUseCase {
    func callAsFunction(userId: String, menuNoteId: String) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedFetchAllMenuNoteUserCase: FetchAllMenuNoteUseCase {
    func callAsFunction(userId: String) async throws(DomainError) -> [MenuNote] {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedRegisterMenuNoteUseCase: RegisterMenuNoteUseCase {
    func callAsFunction(userId: String, menuNote: MenuNote) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedUpdateMenuNoteUseCase: UpdateMenuNoteUseCase {
    func callAsFunction(userId: String, menuNote: MenuNote) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}
