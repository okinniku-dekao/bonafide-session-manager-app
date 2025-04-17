// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import Composition
import Domain

@Reducer
public struct StreamConnectionFeature: Sendable {
    public init() {}
    
    @ObservableState
    public struct State {
        public init() {}
    }
    
    public enum Action {
        case onAppear
        case connectedUserIdReceived(String)
        case streamUserIdFailed(DomainError)
    }
    
    @Dependency(\.deviceUseCases) var device
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .stream {
                    let deviceId = try await device.getDeviceId()
                    return await device.streamConnectedUserId(deviceId: deviceId)
                } map: {
                    .connectedUserIdReceived($0)
                } catch: { error, send in
                    await send(.streamUserIdFailed(error))
                }
                
            case .connectedUserIdReceived(let userId):
                guard !userId.isEmpty else { return .none }
                print(userId, "🔥")
                return .none
                
            case .streamUserIdFailed(let error):
                print(error)
                return .none
            }
        }
    }
}
