//
//  StreamSessionsUseCase.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

public protocol StreamSessionsUseCase: Sendable {
    func callAsFunction(userId: String) -> AsyncThrowingStream<[Session], any Error>
}
