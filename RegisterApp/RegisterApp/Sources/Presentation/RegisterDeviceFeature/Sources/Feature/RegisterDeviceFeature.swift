// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import Composition
import Domain

@Reducer
public struct RegisterDeviceFeature: Sendable {
    public init(){}

    @ObservableState
    public struct State {
        public init() {}
        var device: Device = .init()
        @Presents var alert: AlertState<Action.Alert>?
    }
    
    @CasePathable
    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case onTapRegisterDeviceButton
        case registerDeviceFailed(DomainError)
        case alert(PresentationAction<Alert>)
        case delegate(DelegateAction)
        
        public enum Alert {
            case ok
        }
        
        public enum DelegateAction {
            case registerDeviceSuccess
        }
    }
    
    @Dependency(\.deviceUseCases) var device
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .onTapRegisterDeviceButton:
                return .runDomainError { [inputDevice = state.device] send in
                    try await device.register(inputDevice)
                    await send(.delegate(.registerDeviceSuccess))
                } catch: { error, send in
                    await send(.registerDeviceFailed(error))
                }
                
            case .registerDeviceFailed(let error):
                if case .validation = error {
                    state.alert = AlertState {
                        TextState("エラー")
                    } actions: {
                        ButtonState {
                            TextState("OK")
                        }
                    } message: {
                        TextState("端末名を入力してください")
                    }
                }
                return .none

            default:
                return .none
            }
        }
        .ifLet(\.$alert, action: \.alert)
    }
}
