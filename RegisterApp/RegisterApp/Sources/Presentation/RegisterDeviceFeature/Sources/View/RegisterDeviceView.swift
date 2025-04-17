//
//  RegisterDeviceView.swift
//  RegisterDeviceFeature
//
//  Created by 東　秀斗 on 2025/04/16.
//

import SwiftUI
import ComposableArchitecture
import PresentationHelper
import Domain
import Resources

public struct RegisterDeviceView: View {
    @Perception.Bindable public var store: StoreOf<RegisterDeviceFeature>
    
    public init(store: StoreOf<RegisterDeviceFeature>) {
        self.store = store
    }
    
    private let backgroundColor: UIColor = sharedColors.commonBackground()!
    
    public var body: some View {
        WithPerceptionTracking {
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(l10n.deviceNameInputTitle())
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        TextField(l10n.deviceNameInputPlaceholder(), text: $store.device.deviceName)
                            .padding()
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(l10n.shopSelectTitle())
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Picker("", selection: $store.device.store) {
                            ForEach(Array(Domain.Store.allCases), id: \.label) { selectStore in
                                Text(selectStore.label)
                                    .tag(selectStore)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(4)
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button {
                    store.send(.onTapRegisterDeviceButton)
                } label: {
                    Text(l10n.registerDeviceButtonLabel())
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(uiColor: sharedColors.primary()!))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .alert($store.scope(state: \.alert, action: \.alert))
        }
        .navigationTitle(l10n.registerDeviceTitle())
        .navigationBarTitleDisplayMode(.inline)
        .background(
            Color(uiColor: backgroundColor)
                .ignoresSafeArea()
                .hideKeyboardOnTap()
        )
    }
}

#Preview {
    NavigationView {
        RegisterDeviceView(
            store: Store(
                initialState: RegisterDeviceFeature.State(),
                reducer: { RegisterDeviceFeature() }
            )
        )
    }
}
