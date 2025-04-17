//
//  StreamConnectionView.swift
//  StreamConnectionFeature
//
//  Created by 東　秀斗 on 2025/04/17.
//

import SwiftUI
import ComposableArchitecture
import PresentationHelper
import Resources
import UIComponents

public struct StreamConnectionView: View {
    @Perception.Bindable private var store: StoreOf<StreamConnectionFeature>
    
    public init(store: StoreOf<StreamConnectionFeature>) {
        self.store = store
    }
    
    private let backgroundColor: UIColor = sharedColors.commonBackground()!
    
    public var body: some View {
        WithPerceptionTracking {
            ProgressView()
                .tint(Color(uiColor: sharedColors.primary()!))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Color(uiColor: backgroundColor)
                        .ignoresSafeArea()
                )
                .task {
                    store.send(.onAppear)
                }
                .errorOverlay(error: store.error) {
                    store.send(.retryStreaming)
                }
        }
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
