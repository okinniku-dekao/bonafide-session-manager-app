//
//  MainTabView.swift
//  MainTabFeature
//
//  Created by 東　秀斗 on 2025/04/16.
//

import SwiftUI
import ComposableArchitecture
import StreamSessionFeature

public struct MainTabView: View {
    @Perception.Bindable private var store: StoreOf<MainTabFeature>
    
    public init(store: StoreOf<MainTabFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithPerceptionTracking {
            TabView(selection: $store.currentTab.sending(\.selectedTab)) {
                StreamSessionView(
                    store: store.scope(state: \.sessionState, action: \.sessionAction)
                )
                .tag(MainTabFeature.Tab.session)
                .tabItem {
                    Text("記録")
                }
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    MainTabView(
        store: Store(
            initialState: MainTabFeature.State(),
            reducer: { MainTabFeature() }
        )
    )
}
