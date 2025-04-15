//
//  UnimplementedWeight.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Domain

struct UnimplementedDeleteWeightUseCase: DeleteWeightUseCase {
    func callAsFunction(_ weightId: String) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedFetchAllWeightCase: FetchAllWeightUseCase {
    func callAsFunction() async throws(DomainError) -> [Weight] {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedRegisterWeightUseCase: RegisterWeightUseCase {
    func callAsFunction(_ weight: Weight) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedUpdateWeightUseCase: UpdateWeightUseCase {
    func callAsFunction(_ weight: Weight) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}
