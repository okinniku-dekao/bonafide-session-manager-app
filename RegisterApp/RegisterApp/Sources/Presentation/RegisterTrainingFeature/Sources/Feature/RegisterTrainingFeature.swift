// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture

@Reducer
public struct RegisterTrainingFeature {
    public init() {}
    
    public struct State {
        public init() {}
    }
    
    public enum Action {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}
