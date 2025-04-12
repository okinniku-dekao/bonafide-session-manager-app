//
//  FetchDeviceUseCase.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/12.
//


public protocol FetchDeviceUseCase {
    func callAsFunction(for store: Store?) async throws -> [Device]
}
