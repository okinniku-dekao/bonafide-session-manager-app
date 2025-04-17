//
//  StreamConnectionView.swift
//  StreamConnectionFeature
//
//  Created by 東　秀斗 on 2025/04/17.
//

import SwiftUI
import ComposableArchitecture
import PresentationHelper

public struct StreamConnectionView: View {
    @Perception.Bindable private var store: StoreOf<StreamConnectionFeature>
    
    public init(store: StoreOf<StreamConnectionFeature>) {
        self.store = store
    }
    
    var body: some View {
        VStack {
            ProgressView()
        }
        .trackingPerception()
        .navigationTitle("接続待機")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    StreamConnectionView(
        store: Store(
            initialState: StreamConnectionFeature.State(),
            reducer: { StreamConnectionFeature() }
        )
    )
}
