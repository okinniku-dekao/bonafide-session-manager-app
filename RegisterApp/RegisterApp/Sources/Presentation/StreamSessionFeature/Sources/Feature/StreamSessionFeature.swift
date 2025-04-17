// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import Composition
import Domain
import PresentationHelper

@Reducer
public struct StreamSessionFeature: Sendable {
    public init() {}
    
    @ObservableState
    public struct State {
        public init() {}
        var userId: String = ""
        var sessions: LoadStatus<[Session]> = .idle
        @Presents var alert: AlertState<Action.Alert>?
    }
    
    public enum Action {
        case onAppear(userId: String)
        case sessionsReceived([Session])
        case streamSessionFailed(DomainError)
        case alert(PresentationAction<Alert>)
        
        public enum Alert {
            case ok
        }
    }
    
    private enum CancelId {
        case stream
    }
    
    @Dependency(\.sessionUseCases) var session
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear(let userId):
                state.userId = userId
                state.sessions = .loading
                
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
            }
        }
        .ifLet(\.$alert, action: \.alert)
    }
}
