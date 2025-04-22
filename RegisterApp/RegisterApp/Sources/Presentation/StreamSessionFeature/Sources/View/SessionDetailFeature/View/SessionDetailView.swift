//
//  SessionDetailView.swift
//  StreamSessionFeature
//
//  Created by 東　秀斗 on 2025/04/22.
//

import SwiftUI
import Domain
import UIComponents

public struct SessionDetailView: View {
    private let session: Session
    private let transition: (Session) -> Void
    
    public init(session: Session, transition: @escaping (Session) -> Void) {
        self.session = session
        self.transition = transition
    }
    
    public var body: some View {
        VStack {
            GIFImage(name: session.name)
            Text(session.note)
        }
        .overlay(alignment: .bottom) {
            Button {
                transition(session)
            } label: {
                Text("登録する")
            }
            .buttonStyle(CommonButtonStyle())
        }
    }
}

#if DEBUG
#Preview {
    SessionDetailView(session: .preview(path: "103_Dynamic_Stretch")) { _ in }
}
#endif
