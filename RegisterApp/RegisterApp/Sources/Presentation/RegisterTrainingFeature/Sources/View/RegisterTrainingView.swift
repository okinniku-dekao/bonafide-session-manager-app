//
//  RegisterTrainingView.swift
//  RegisterTrainingFeature
//
//  Created by 東　秀斗 on 2025/04/23.
//

import SwiftUI
import ComposableArchitecture
import UIComponents
import Resources

public struct RegisterTrainingView: View {
    @Perception.Bindable private var store: StoreOf<RegisterTrainingFeature>
    
    public init(store: StoreOf<RegisterTrainingFeature>) {
        self.store = store
    }
    
    private let backgroundColor: UIColor = sharedColors.commonBackground()!
    public var body: some View {
        WithPerceptionTracking {
            VStack(spacing: 0) {
                header
                Divider()
                if store.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    if let menu = store.menu.value {
                        Text(menu.name)
                    }
                    if let weights = store.weights.value {
                        ForEach(weights, id: \.self) { weight in
                            Text(weight.name)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .overlay(alignment: .bottom) {
                Button {
                    store.send(.onTapRegister)
                } label: {
                    Text("登録する")
                }
                .buttonStyle(CommonButtonStyle())
                .frame(height: 52)
                .padding(.bottom, 10)
            }
            .errorOverlay(error: store.error) {
                store.send(.retry)
            }
            .background(Color(uiColor: backgroundColor))
            .task {
                store.send(.onAppear)
            }
        }
    }
    
    private var header: some View {
        Text("トレーニング登録")
            .foregroundStyle(Color.black)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .overlay(alignment: .trailing) {
                Button {
                    store.send(.onTapClose)
                } label: {
                    Text("閉じる")
                }
                .padding(.trailing)
            }
            .background(Color(uiColor: backgroundColor))
    }
}

#Preview {
    RegisterTrainingView(
        store: Store(
            initialState: RegisterTrainingFeature.State.initial(session: .preview()),
            reducer: { RegisterTrainingFeature() }
        )
    )
}
