//
//  AppRootFeature.swift
//  AppRootFeature
//
//  Created by hideto.higashi on 2025/03/04.
//

import ComposableArchitecture
import Composition
import Domain
import PresentationHelper

@Reducer
public struct AppRootFeature: Sendable {
    public init() {}

    public struct State: Equatable {
        public init() {
        }
    }

    public enum Action: Equatable {
        case onAppear
        case stream
        case menuReceived([Menu])
        case menuReceiveFailed(DomainError)
        case sessionsreceived([Session])
    }

    @Dependency(\.userUseCases) var user
    @Dependency(\.menuUseCases) var menu
    @Dependency(\.sessionUseCases) var session
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .run { _ in
                    let users = try await user.fetchAll(for: nil)
                    let menus = try await menu.fetchAll()
                } catch: { error, _ in
                    if let error = error as? DomainError {
                        print(error, "🔥")
                    }
                }
                
            case .stream:
                return .stream(session.stream(userId: "560e50e2-23b8-41ac-90d0-830a2c69a9dc")) {
                    .sessionsreceived($0)
                } catch: { error, _ in
                    print(error as? DomainError)
                }
                
            case .menuReceived(let menus):
                return .none
                
            case .menuReceiveFailed(let error):
                return .none
                
            case .sessionsreceived(let sessions):
                return .none
            }
        }
    }
}
