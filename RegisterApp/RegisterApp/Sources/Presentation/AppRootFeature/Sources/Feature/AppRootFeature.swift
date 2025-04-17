//
//  AppRootFeature.swift
//  AppRootFeature
//
//  Created by hideto.higashi on 2025/03/04.
//

import Foundation
import ComposableArchitecture
import Composition
import Domain
import PresentationHelper
import MainTabFeature
import RegisterDeviceFeature
import StreamConnectionFeature

@Reducer
public struct AppRootFeature: Sendable {
    public init() {}

    @Reducer
    public enum Destination {
        case mainTab(MainTabFeature)
        case registerDevice(RegisterDeviceFeature)
        case streamConnection(StreamConnectionFeature)
    }
    
    @ObservableState
    public struct State {
        public init() {}
        @Presents var destination: Destination.State?
    }

    @CasePathable
    public enum Action {
        case onAppear
        case deviceIdReceived(String)
        case deviceIdGetFailed(DomainError)
        case destination(PresentationAction<Destination.Action>)
    }

    @Dependency(\.deviceUseCases) var device
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .runDomainError { send in
                    await send(.deviceIdReceived(try await device.getDeviceId()))
                } catch: { error, send in
                    await send(.deviceIdGetFailed(error))
                }
                
            case .deviceIdReceived:
                // 端末IDが登録されていた場合はコネクション待機画面へ遷移させる
                state.destination = .streamConnection(.init())
                return .none

            case .deviceIdGetFailed(let error):
                if error == .notFound {
                    // 端末IDが未登録の場合は、端末登録画面に遷移させる
                    state.destination = .registerDevice(.init())
                }
                return .none
                
            case .destination(.presented(.registerDevice(.delegate(.registerDeviceSuccess)))):
                // 端末登録が完了したらコネクション待機画面に遷移させる
                state.destination = .streamConnection(.init())
                return .none
                
            case .destination:
                return .none
            }
        }
        .ifLet(\.$destination, action: \.destination)
    }
}
