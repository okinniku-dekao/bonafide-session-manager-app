// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import Composition
import Domain
import PresentationHelper
import AppSharedState
import RegisterTrainingFeature

@Reducer
public struct StreamSessionFeature: Sendable {
    public init() {}
    
    @ObservableState
    public struct State {
        public init() {}
        @Shared(.appSharedState) var appSharedState = AppSharedState()
        var sessions: LoadStatus<[Session]> = .idle
        @Presents var alert: AlertState<Action.Alert>?
        @Presents var sessionDetail: SessionDetailFeature.State?
        @Presents var registerTrainingState: RegisterTrainingFeature.State?
        var userName: String {
            guard let user = appSharedState.connectedUser else {
                preconditionFailure("値をセットしてから読み込んでください")
            }
            return user.name
        }
        
        var userId: String {
            guard let userId = appSharedState.connectedUser?.id else {
                fatalError("userIdが未設定で呼ばれることはない")
            }
            return userId
        }
    }
    
    public enum Action {
        case onAppear
        case sessionsReceived([Session])
        case streamSessionFailed(DomainError)
        case alert(PresentationAction<Alert>)
        case onTapSessionRow(Session)
        case sessionDetailAction(PresentationAction<SessionDetailFeature.Action>)
        case registerTrainingAction(PresentationAction<RegisterTrainingFeature.Action>)
        case inBackground
        case inForeground

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
                return .merge(
                    .lifecycleObserver { send in
                        await send(.inBackground)
                    } inForeground: { send in
                        await send(.inForeground)
                    },
                    streamSession(of: state.userId)
                )
                
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
                
            case .onTapSessionRow(let session):
                state.sessionDetail = .init(sesison: session)
                return .none
                
            case .sessionDetailAction(.presented(.delegate(.transitionToRegister(let session)))):
                state.registerTrainingState = .initial(session: session)
                return .none
                
            case .inBackground:
                return .cancel(id: CancelId.stream)
                
            case .inForeground:
                return streamSession(of: state.userId)
                
            default:
                return .none
            }
        }
        .ifLet(\.$alert, action: \.alert)
        .ifLet(\.$sessionDetail, action: \.sessionDetailAction) {
            SessionDetailFeature()
        }
        .ifLet(\.$registerTrainingState, action: \.registerTrainingAction) {
            RegisterTrainingFeature()
        }
    }
    
    private func streamSession(of userId: String) -> Effect<Action> {
        .stream {
            await session.stream(userId: userId)
        } map: {
            .sessionsReceived($0)
        } catch: { error, send in
            await send(.streamSessionFailed(error))
        }
        .cancellable(id: CancelId.stream)
    }
}
