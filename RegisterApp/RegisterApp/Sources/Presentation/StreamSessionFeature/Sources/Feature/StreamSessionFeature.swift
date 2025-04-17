// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import Composition
import Domain
import PresentationHelper
import AppSharedState

@Reducer
public struct StreamSessionFeature: Sendable {
    public init() {}
    
    @ObservableState
    public struct State {
        public init() {}
        @Shared(.appSharedState) var appSharedState = AppSharedState()
        var sessions: LoadStatus<[Session]> = .idle
        @Presents var alert: AlertState<Action.Alert>?
        var userName: String {
            guard let user = appSharedState.connectedUser else {
                preconditionFailure("値をセットしてから読み込んでください")
            }
            return user.name
        }
    }
    
    public enum Action {
        case onAppear
        case sessionsReceived([Session])
        case streamSessionFailed(DomainError)
        case alert(PresentationAction<Alert>)
        case test

        public enum Alert {
            case ok
        }
    }
    
    private enum CancelId {
        case stream
    }
    
    @Dependency(\.sessionUseCases) var session
    @Dependency(\.uuid) var uuid
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.sessions = .loading
                guard let userId = state.appSharedState.connectedUser?.id else {
                    preconditionFailure()
                }
                return .stream {
                    await session.stream(userId: userId)
                } map: {
                    .sessionsReceived($0)
                } catch: { error, send in
                    await send(.streamSessionFailed(error))
                }
                .cancellable(id: CancelId.stream)
                
            case .sessionsReceived(let sessions):
                state.sessions = .loaded(sessions)
                return .none
                
            case .streamSessionFailed(let error):
                state.sessions = .error(error)
                state.alert = AlertState {
                    TextState("エラー")
                } actions: {
                    ButtonState {
                        TextState("OK")
                    }
                } message: {
                    TextState("セッション情報の取得に失敗しました")
                }
                return .none
                
            case .alert:
                return .none
                
            case .test:
                return .run { [userId = state.appSharedState.connectedUser!.id] _ in
                    try await session.register(
                        userId: userId,
                        sessions: [
                            .init(id: uuid().uuidString, name: "トレーニング4", note: "簡単", number: 0, path: ""),
                            .init(id: uuid().uuidString, name: "トレーニング5", note: "普通", number: 0, path: ""),
                            .init(id: uuid().uuidString, name: "トレーニング6", note: "難しい", number: 0, path: ""),
                        ]
                    )
                } catch: { error, send in
                    print(error as! DomainError)
                }
            }
        }
        .ifLet(\.$alert, action: \.alert)
    }
}
