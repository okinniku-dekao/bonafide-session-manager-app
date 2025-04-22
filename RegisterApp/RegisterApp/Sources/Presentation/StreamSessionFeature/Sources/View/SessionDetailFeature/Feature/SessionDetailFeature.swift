//
//  SessionDetailFeature.swift
//  StreamSessionFeature
//
//  Created by 東　秀斗 on 2025/04/22.
//

import ComposableArchitecture
import Domain

@Reducer
public struct SessionDetailFeature: Sendable {
    public init() {}

    @ObservableState
    public struct State {
        public init(sesison: Session) {
            self.session = sesison
        }
        let session: Session
    }
    
    @CasePathable
    public enum Action {
        case onTapClose
    }
    
    @Dependency(\.dismiss) var dismiss
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onTapClose:
                return .run { _ in
                    await dismiss()
                }
            }
        }
    }
}
