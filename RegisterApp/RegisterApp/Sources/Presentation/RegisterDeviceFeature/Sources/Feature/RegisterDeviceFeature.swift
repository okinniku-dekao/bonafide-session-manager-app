// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture

@Reducer
public struct RegisterDeviceFeature {
    public init(){}

    @ObservableState
    public struct State {
        public init() {}
    }
    
    @CasePathable
    public enum Action {
        case onAppear
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
