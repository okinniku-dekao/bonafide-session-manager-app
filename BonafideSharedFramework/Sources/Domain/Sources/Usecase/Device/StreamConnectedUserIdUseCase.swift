//
//  StreamConnectedUserIdUseCase.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/17.
//

public protocol StreamConnectedUserIdUseCase: Sendable {
    func callAsFunction(deviceId: String) async -> AsyncThrowingStream<String, any Error>
}
