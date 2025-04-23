//
//  SessionDetailView.swift
//  StreamSessionFeature
//
//  Created by 東　秀斗 on 2025/04/22.
//

import SwiftUI
import Domain
import UIComponents
import ComposableArchitecture
import Resources

public struct SessionDetailView: View {
    @Perception.Bindable private var store: StoreOf<SessionDetailFeature>
    
    public init(store: StoreOf<SessionDetailFeature>) {
        self.store = store
    }
    
    private let backgroundColor: UIColor = sharedColors.commonBackground()!
    public var body: some View {
        WithPerceptionTracking {
            VStack(spacing: 0) {
                header
                Divider()
                ScrollView {
                    VStack {
                        GIFImage(name: store.session.path)
                            .padding(.horizontal)
                        TipsView(note: store.session.note)
                    }
                    .padding(.top, 12)
                    .padding(.bottom, 64)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .overlay(alignment: .bottom) {
                Button {
                } label: {
                    Text("登録する")
                }
                .buttonStyle(CommonButtonStyle())
                .frame(height: 52)
                .padding(.bottom, 10)
            }
            .background(Color(uiColor: backgroundColor))
        }
    }
    
    private var header: some View {
        Text(store.session.name)
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

#if DEBUG
#Preview {
    SessionDetailView(
        store: Store(
            initialState: SessionDetailFeature.State(sesison: .preview()),
            reducer: { SessionDetailFeature() }
        )
    )
}
#endif
