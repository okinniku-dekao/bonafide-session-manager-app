// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComposableArchitecture
import Domain

@Reducer
public struct RegisterTrainingFeature: Sendable {
    public init() {}
    
    @ObservableState
    public struct State {
        public init(session: Session) {
            self.session = session
        }
        let session: Session
    }
    
    @CasePathable
    public enum Action {
        case onTapClose
        case onTapRegister
    }
    
    @Dependency(\.dismiss) var dismiss
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onTapClose:
                return .run { _ in
                    await dismiss()
                }
                
            default:
                return .none
            }
        }
    }
}
