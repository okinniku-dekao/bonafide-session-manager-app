// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import Domain

@Reducer
public struct RegisterDeviceFeature {
    public init(){}

    @ObservableState
    public struct State {
        public init() {}
        var device: Device = .init()
    }
    
    @CasePathable
    public enum Action: BindableAction {
        case binding(BindingAction<State>)
        case onAppear
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
