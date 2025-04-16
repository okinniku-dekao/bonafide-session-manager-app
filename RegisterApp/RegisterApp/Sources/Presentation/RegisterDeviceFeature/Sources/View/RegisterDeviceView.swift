//
//  RegisterDeviceView.swift
//  RegisterDeviceFeature
//
//  Created by 東　秀斗 on 2025/04/16.
//

import SwiftUI
import ComposableArchitecture

public struct RegisterDeviceView: View {
    @Perception.Bindable private var store: StoreOf<RegisterDeviceFeature>
    
    public init(store: StoreOf<RegisterDeviceFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithPerceptionTracking {
            Text("RegisterDeviceView")
                .task {
                    store.send(.onAppear)
                }
        }
        .navigationTitle("端末登録")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    RegisterDeviceView(
        store: Store(
            initialState: RegisterDeviceFeature.State(),
            reducer: { RegisterDeviceFeature() }
        )
    )
}
