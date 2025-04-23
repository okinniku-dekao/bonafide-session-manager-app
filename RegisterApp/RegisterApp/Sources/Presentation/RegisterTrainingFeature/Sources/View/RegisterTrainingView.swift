//
//  RegisterTrainingView.swift
//  RegisterTrainingFeature
//
//  Created by 東　秀斗 on 2025/04/23.
//

import SwiftUI
import ComposableArchitecture

public struct RegisterTrainingView: View {
    @Perception.Bindable private var store: StoreOf<RegisterTrainingFeature>
    
    public init(store: StoreOf<RegisterTrainingFeature>) {
        self.store = store
    }
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RegisterTrainingView(
        store: Store(
            initialState: RegisterTrainingFeature.State(),
            reducer: { RegisterTrainingFeature() }
        )
    )
}
