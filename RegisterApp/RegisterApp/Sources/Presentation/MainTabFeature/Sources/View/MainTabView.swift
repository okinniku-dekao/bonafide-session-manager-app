//
//  MainTabView.swift
//  MainTabFeature
//
//  Created by 東　秀斗 on 2025/04/16.
//

import SwiftUI
import ComposableArchitecture

public struct MainTabView: View {
    private let store: StoreOf<MainTabFeature>
    
    public init(store: StoreOf<MainTabFeature>) {
        self.store = store
    }
    
    public var body: some View {
        Text("MainTabView")
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
