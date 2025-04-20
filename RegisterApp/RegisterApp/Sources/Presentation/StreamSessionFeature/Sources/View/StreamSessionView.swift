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

public struct StreamSessionView: View {
    @Perception.Bindable private var store: StoreOf<StreamSessionFeature>
    
    public init(store: StoreOf<StreamSessionFeature>) {
        self.store = store
    }
    
    private let backgroundColor: UIColor = sharedColors.commonBackground()!
    public var body: some View {
        WithPerceptionTracking {
            VStack {
                Text(store.userName)
                    .font(.title)
                    .foregroundStyle(Color.black)
                Button {
                    store.send(.test)
                } label: {
                    Text("セッション追加")
                }
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
                                SessionRowView(session: session) {}
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
        }
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

struct SessionRowView: View {
    let session: Session
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                Text(session.name)
                    .font(.headline)
                    .foregroundStyle(Color.black)
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color.white)
            .contentShape(Rectangle())
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    NavigationView {
        StreamSessionView(
            store: Store(
                initialState: StreamSessionFeature.State(),
                reducer: { StreamSessionFeature() }
            )
        )
    }
}
