//
//  AppRootView.swift
//  AppRootFeature
//
//  Created by hideto.higashi on 2025/03/04.
//

import SwiftUI
import ComposableArchitecture
import MainTabFeature
import RegisterDeviceFeature
import StreamConnectionFeature

public struct AppRootView: View {
    public init(store: StoreOf<AppRootFeature>) {
        self.store = store
    }
    
    @Perception.Bindable var store: StoreOf<AppRootFeature>
    
    public var body: some View {
        NavigationView {
            WithPerceptionTracking {
                if let destination = store.destination {
                    switch destination {
                    case .mainTab:
                        if let store = store.scope(state: \.destination?.mainTab, action: \.destination.mainTab) {
                            MainTabView(store: store)
                        }
                    case .registerDevice:
                        if let store = store.scope(state: \.destination?.registerDevice, action: \.destination.registerDevice) {
                            RegisterDeviceView(store: store)
                        }
                    case .streamConnection:
                        if let store = store.scope(state: \.destination?.streamConnection, action: \.destination.streamConnection) {
                            StreamConnectionView(store: store)
                        }
                    }
                } else {
                    ProgressView()
                        .onAppear {
                            store.send(.onAppear)
                        }
                        .navigationBarHidden(true)
                }
            }
        }
    }
}

#Preview {
    AppRootView(
        store: Store(
            initialState: AppRootFeature.State(),
            reducer: { AppRootFeature() }
        )
    )
}
