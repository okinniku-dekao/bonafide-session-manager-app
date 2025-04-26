//
//  WeightInputView.swift
//  RegisterTrainingFeature
//
//  Created by 東　秀斗 on 2025/04/25.
//

import SwiftUI
import ComposableArchitecture

struct WeightInputView: View {
    @Perception.Bindable private var store: StoreOf<RegisterTrainingFeature>
    
    init(store: StoreOf<RegisterTrainingFeature>) {
        self.store = store
    }
    
    var body: some View {
        WithPerceptionTracking {
            Picker("", selection: $store.weightSelection) {
                ForEach(RegisterTrainingFeature.WeightInputMode.allCases, id: \.self) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            WeightGrid(weights: store.weightsValue)
        }
    }
}
