//
//  StreamSessionView.swift
//  StreamSessionFeature
//
//  Created by 東　秀斗 on 2025/04/17.
//

import SwiftUI
import ComposableArchitecture
import PresentationHelper
import Resources
import Domain
import Composition
import AppSharedState

public struct StreamSessionView: View {
    @Perception.Bindable private var store: StoreOf<StreamSessionFeature>
    
    public init(store: StoreOf<StreamSessionFeature>) {
        self.store = store
    }
    
    private let backgroundColor: UIColor = sharedColors.commonBackground()!
    public var body: some View {
        WithPerceptionTracking {
            VStack(spacing: 0) {
                header
                    .padding(10)
                switch store.sessions {
                case .idle:
                    EmptyView()
                case .loading:
                    ProgressView()
                        .tint(Color(uiColor: sharedColors.primary()!))
                case .loaded(let sessions):
                    if sessions.isEmpty {
                        Text("セッションがありません")
                            .font(.headline)
                            .foregroundColor(Color.black)
                            .padding()
                    } else {
                        ScrollView(showsIndicators: false) {
                            ForEach(sessions) { session in
                                SessionRowView(session: session) {
                                    store.send(.onTapSessionRow(session))
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                case .error:
                    Text("エラーが発生しました")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(
                Color(uiColor: backgroundColor)
                    .ignoresSafeArea()
            )
            .alert($store.scope(state: \.alert, action: \.alert))
            .task {
                store.send(.onAppear)
            }
            .sheet(item: $store.scope(state: \.sessionDetail, action: \.sessionDetailAction)) {
                SessionDetailView(store: $0)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }

    private var header: some View {
        VStack {
            Text("\(store.userName) 様")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("本日のメニュー")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.title3)
        .foregroundStyle(Color.black)
    }
}

#if DEBUG
extension StreamSessionFeature.State {
    static func preview() -> StreamSessionFeature.State {
        let state = StreamSessionFeature.State()
        var sharedState: AppSharedState = .init()
        sharedState.setUser(.preview)
        state.$appSharedState.withLock { $0 = sharedState }
        return state
    }
}

#Preview {
    NavigationView {
        StreamSessionView(
            store: Store(
                initialState: .preview(),
                reducer: { StreamSessionFeature() }
            )
        )
    }
}
#endif
