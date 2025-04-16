//
//  DeviceUseCases.swift
//  Composition
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Dependencies
import Domain
import Usecase
import Data
import Infrastructure

public struct DeviceUseCases: Sendable {
    public var delete: any DeleteDeviceUseCase
    public var fetchAll: any FetchAllDeviceUseCase
    public var fetchDetail: any FetchDeviceDetailUseCase
    public var register: any RegisterDeviceUseCase
    public var update: any UpdateDeviceUseCase
    public var getDeviceId: any GetDeviceIdUseCase
}

public extension DependencyValues {
    var deviceUseCases: DeviceUseCases {
        get { self[DeviceUseCases.self] }
        set { self[DeviceUseCases.self] = newValue }
    }
}

extension DeviceUseCases: DependencyKey {
    private static let firebaseDataStoreImpl: FirebaseDataStore = FirebaseDataStoreImpl()
    nonisolated(unsafe) public static var serviceName: String = ""
    private static let localDataStoreImpl: LocalDataStore = {
        guard !serviceName.isEmpty else { fatalError("AppDelegate内でserviceNameを設定してください") }
        return LocalDataStoreImpl(service: serviceName)
    }()
    private static let deviceRepositoryImpl: DeviceRepository = DeviceRepositoryImpl(firebaseDataStore: firebaseDataStoreImpl)
    private static let keychainRepositoryImpl: KeychainRepository = KeychainRepositoryImpl(localDataStore: localDataStoreImpl)

    public static var liveValue: DeviceUseCases {
        Self(
            delete: DeleteDeviceUseCaseImpl(deviceRepository: deviceRepositoryImpl),
            fetchAll: FetchAllDeviceUseCaseImpl(deviceRepository: deviceRepositoryImpl),
            fetchDetail: FetchDeviceDetailUseCaseImpl(deviceRepository: deviceRepositoryImpl),
            register: RegisterDeviceUseCaseImpl(
                deviceRepository: deviceRepositoryImpl,
                keychainRepository: keychainRepositoryImpl
            ),
            update: UpdateDeviceUseCaseImpl(deviceRepository: deviceRepositoryImpl),
            getDeviceId: GetDeviceIdUseCaseImpl(keychainRepository: keychainRepositoryImpl)
        )
    }
    
    public static var testValue: DeviceUseCases {
        Self(
            delete: UnimplementedDeleteDeviceUseCase(),
            fetchAll: UnimplementedFetchAllDeviceUserCase(),
            fetchDetail: UnimplementedFetchDeviceDetailUseCase(),
            register: UnimplementedRegisterDeviceUseCase(),
            update: UnimplementedUpdateDeviceUseCase(),
            getDeviceId: UnimplementedGetDeviceIdUseCase()
        )
    }
}
