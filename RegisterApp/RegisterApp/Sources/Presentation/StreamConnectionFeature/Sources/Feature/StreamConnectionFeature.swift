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
        case delegate(DelegateAction)
        
        public enum DelegateAction {
            case connectedUserIdReceived(String)
        }
    }
    
    private enum CancelId {
        case stream
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
                .cancellable(id: CancelId.stream)

            case .connectedUserIdReceived(let userId):
                guard !userId.isEmpty else { return .none }
                return .concatenate(
                    .cancel(id: CancelId.stream),
                    .send(.delegate(.connectedUserIdReceived(userId)))
                )
                
            case .streamUserIdFailed(let error):
                print(error)
                return .none
                
            default:
                return .none
            }
        }
    }
}
