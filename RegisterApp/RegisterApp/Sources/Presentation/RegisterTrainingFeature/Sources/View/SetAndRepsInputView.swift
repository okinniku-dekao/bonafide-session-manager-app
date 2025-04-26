//
//  SetAndRepsInputView.swift
//  RegisterTrainingFeature
//
//  Created by 東　秀斗 on 2025/04/25.
//

import SwiftUI
import ComposableArchitecture

struct SetAndRepsInputView: View {
    @Perception.Bindable private var store: StoreOf<RegisterTrainingFeature>
    
    init(store: StoreOf<RegisterTrainingFeature>) {
        self.store = store
    }
    
    var body: some View {
        WithPerceptionTracking {
            VStack(spacing: 15) {
                counterRow(
                    label: "回数",
                    value: store.trainingRecord.reps
                ) {
                    store.send(.incrementReps)
                } onTapMinus: {
                    store.send(.decrementReps)
                }
                counterRow(
                    label: "セット数",
                    value: store.trainingRecord.sets
                ) {
                    store.send(.incrementSets)
                } onTapMinus: {
                    store.send(.decrementSets)
                }
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    private func counterRow(
        label: String,
        value: Int,
        onTapPlus: @escaping () -> Void,
        onTapMinus: @escaping () -> Void
    ) -> some View {
        HStack {
            Text(label)
                .font(.system(size: 18, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Button(action: onTapMinus) {
                Image(systemName: "minus.circle")
                    .font(.system(size: 28))
            }
            
            Text("\(value)")
                .frame(width: 40)
                .multilineTextAlignment(.center)
                .font(.system(size: 20, weight: .bold))
            
            Button(action: onTapPlus) {
                Image(systemName: "plus.circle")
                    .font(.system(size: 28))
            }
        }
        .frame(maxWidth: .infinity)
    }
}
