//
//  UnimplementedTrainingRecord.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Domain

struct UnimplementedDeleteTrainingRecordUseCase: DeleteTrainingRecordUseCase {
    func callAsFunction(userId: String, recordId: String) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedFetchAllTrainingRecordCase: FetchAllTrainingRecordUseCase {
    func callAsFunction(_ userId: String) async throws(DomainError) -> [TrainingRecord] {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}

struct UnimplementedRegisterTrainingRecordUseCase: RegisterTrainingRecordUseCase {
    func callAsFunction(userId: String, trainingRecord: TrainingRecord) async throws(DomainError) {
        preconditionFailure("\("\(Self.self)".dropFirst(13)) is not implemented")
    }
}
