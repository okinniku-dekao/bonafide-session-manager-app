//
//  TimeInputView.swift
//  RegisterTrainingFeature
//
//  Created by 東　秀斗 on 2025/04/25.
//

import SwiftUI
import ComposableArchitecture

struct TimeInputView: View {
    @Perception.Bindable private var store: StoreOf<RegisterTrainingFeature>
    
    init(store: StoreOf<RegisterTrainingFeature>) {
        self.store = store
    }
    
    var body: some View {
        WithPerceptionTracking {
            VStack {
                Picker("", selection: $store.timeSelection.animation()) {
                    ForEach(RegisterTrainingFeature.TimeInputMode.allCases, id: \.self) {
                        Text($0.rawValue)
                            .tag($0)
                    }
                }
                .pickerStyle(.segmented)
                
                .padding([.horizontal, .top])
                
                switch store.timeSelection {
                case .timeSelect:
                    timeSelection
                    
                case .setAndReps:
                    SetAndRepsInputView(store: store)
                }
            }
        }
    }
    
    @ViewBuilder
    private var timeSelection: some View {
        let duration = store.trainingRecord.durationInSeconds ?? 0
        Text("\(duration / 60)分\(duration % 60)秒")
            .bold()
            .padding(.all)
            .frame(maxWidth: .infinity)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 2)
            }
            .padding(.all)
            .foregroundStyle(Color.black)
            
        HStack(spacing: 0) {
            ForEach(RegisterTrainingFeature.TimeMode.allCases, id: \.self) { timeMode in
                timeInput(timeMode) {
                    store.send(.onTapTimeIncrement(timeMode.value))
                } onTapMinus: {
                    store.send(.onTapTimeDecrement(timeMode.value))
                }
            }
        }
    }
    
    @ViewBuilder
    private func timeInput(
        _ mode: RegisterTrainingFeature.TimeMode,
        onTapPlus: @escaping () -> Void,
        onTapMinus: @escaping () -> Void
    ) -> some View {
        HStack {
            Button(action: onTapMinus) {
                Image(systemName: "minus.circle")
                    .font(.system(size: 28))
            }
            
            Text(mode.rawValue)
                .bold()
                .foregroundColor(.black)
            
            Button(action: onTapPlus) {
                Image(systemName: "plus.circle")
                    .font(.system(size: 28))
            }
        }
        .frame(maxWidth: .infinity)
    }
}
