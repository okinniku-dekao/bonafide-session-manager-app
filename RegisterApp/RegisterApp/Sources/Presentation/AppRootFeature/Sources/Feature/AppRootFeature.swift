//
//  AppRootFeature.swift
//  AppRootFeature
//
//  Created by hideto.higashi on 2025/03/04.
//

import ComposableArchitecture
import Composition
import Domain
import PresentationHelper

@Reducer
public struct AppRootFeature: Sendable {
    public init() {}

    public struct State: Equatable {
        public init() {
        }
    }

    public enum Action: Equatable {
        case onAppear
    }

    @Dependency(\.deviceUseCases) var device
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { _ in
                    let deviceId = try await device.getDeviceId()
                } catch: { error, _ in
                    if let error = error as? DomainError {
                        print(error, "🔥")
                    }
                }
            }
        }
    }
}
