//
//  StreamConnectedUserIdUseCaseImpl.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/17.
//

import Domain

public struct StreamConnectedUserIdUseCaseImpl: StreamConnectedUserIdUseCase {
    private let deviceRepository: DeviceRepository
    
    public init(deviceRepository: DeviceRepository) {
        self.deviceRepository = deviceRepository
    }
    
    public func callAsFunction(deviceId: String) -> AsyncThrowingStream<String, any Error> {
        deviceRepository.streamConnectedUserId(deviceId: deviceId)
    }
}
