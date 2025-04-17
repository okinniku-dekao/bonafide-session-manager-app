//
//  StreamSessionView.swift
//  StreamSessionFeature
//
//  Created by 東　秀斗 on 2025/04/17.
//


// StreamSessionView.swift
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
                        List {
                            ForEach(sessions) { session in
                                SessionRowView(session: session)
                            }
                        }
                        .listStyle(.plain)
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
        .navigationTitle("セッション一覧")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SessionRowView: View {
    let session: Session
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(session.name)
                .font(.headline)
            
            if !session.note.isEmpty {
                Text(session.note)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Text("セッション番号: \(session.number)")
                .font(.caption)
                .foregroundColor(.secondary)
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
