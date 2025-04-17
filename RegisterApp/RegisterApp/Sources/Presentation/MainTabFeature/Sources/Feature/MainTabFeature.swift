// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import StreamSessionFeature

@Reducer
public struct MainTabFeature {
    public init() {}
    
    public enum Tab {
        case session
        case history
    }

    @ObservableState
    public struct State {
        public init() {}
        var currentTab: Tab = .session
        var sessionState: StreamSessionFeature.State = .init()
    }
    
    @CasePathable
    public enum Action {
        case selectedTab(Tab)
        case sessionAction(StreamSessionFeature.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .selectedTab(let tab):
                state.currentTab = tab
                return .none
                
            default:
                return .none
            }
        }
        Scope(state: \.sessionState, action: \.sessionAction) {
            StreamSessionFeature()
        }
    }
}
