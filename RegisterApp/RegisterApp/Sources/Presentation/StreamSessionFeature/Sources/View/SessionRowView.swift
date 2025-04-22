//
//  SessionRowView.swift
//  StreamSessionFeature
//
//  Created by 東　秀斗 on 2025/04/21.
//

import SwiftUI
import Domain
import PresentationHelper
import UIComponents

struct SessionRowView: View {
    let session: Session
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                GIFImage(name: session.path)
                    .gifImageStyle(RoundedGIFImageStyle())
                    .padding(.vertical, 10)
                Text(session.name)
                    .font(.headline)
                    .foregroundStyle(Color.black)
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .background(Color.white)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: Color.gray.opacity(0.1), radius: 10, x: 1, y: 1)
        .frame(maxHeight: 60)
    }
}

#if DEBUG
#Preview {
    SessionRowView(session: .preview(), onTap: {})
}
#endif
