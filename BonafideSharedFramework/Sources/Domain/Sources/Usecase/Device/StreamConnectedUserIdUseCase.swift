//
//  StreamConnectedUserIdUseCase.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/17.
//

public protocol StreamConnectedUserIdUseCase {
    func callAsFunction(deviceId: String) -> AsyncThrowingStream<String, any Error>
}
