// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture

@Reducer
public struct MainTabFeature {
    public init() {}
    
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action: Equatable {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
