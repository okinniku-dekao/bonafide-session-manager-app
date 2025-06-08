//
//  WrapView.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/06/08.
//

import SwiftUI
import UIKit
import Foundation

struct SizePreferenceKey: PreferenceKey {
    static let defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct WrapView<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    @State private var totalHeight: CGFloat = 0
    let items: Data
    let contentBuilder: (Data.Element) -> Content
    let horizontalSpacing: CGFloat
    let verticalSpacing: CGFloat
    
    init(
        items: Data,
        horizontalSpacing: CGFloat = 8,
        verticalSpacing: CGFloat = 8,
        @ViewBuilder contentBuilder: @escaping (Data.Element) -> Content
    ) {
        self.items = items
        self.contentBuilder = contentBuilder
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: verticalSpacing) {
                let rows = calculateRows(availableWidth: geometry.size.width)
                ForEach(Array(rows.enumerated()), id: \.offset) { _, row in
                    HStack(spacing: horizontalSpacing) {
                        ForEach(row, id: \.self) { item in
                            contentBuilder(item)
                        }
                        Spacer()
                    }
                }
            }
            .background(
                GeometryReader { reader in
                    Color.clear
                        .preference(key: SizePreferenceKey.self, value: reader.size.height)
                }
            )
        }
        .onPreferenceChange(SizePreferenceKey.self) { newHeight in
            totalHeight = newHeight
        }
        .frame(height: totalHeight)
    }
    
    @MainActor
    private func calculateRows(availableWidth: CGFloat) -> [[Data.Element]] {
        guard !items.isEmpty else { return [] }
        var rows: [[Data.Element]] = []
        var currentRow: [Data.Element] = []
        var currentLineWidth: CGFloat = 0.0
        
        for item in items {
            let itemView = contentBuilder(item)
            
            let hostingController = UIHostingController(rootView: itemView)
            hostingController.view.sizeToFit()
            let itemSize = hostingController.view.sizeThatFits(
                CGSize(width: availableWidth, height: .greatestFiniteMagnitude))
            
            if currentLineWidth + itemSize.width + (currentRow.isEmpty ? 0 : horizontalSpacing) > availableWidth {
                rows.append(currentRow)
                currentRow = []
                currentLineWidth = 0.0
            }
            
            currentRow.append(item)
            currentLineWidth += itemSize.width + (currentRow.count > 1 ? horizontalSpacing : 0)
        }
        
        if !currentRow.isEmpty {
            rows.append(currentRow)
        }
        
        return Array(rows)
    }
}

#Preview {
    WrapView(
        items: [
            "チューブ", "半円ポール", "ピラティスボール",
            "グリップ", "ポール", "長い長い文字列長い長い文字列長い長い文字列",
            "プレート"
        ]
    ) {
        
        Text($0)
            .padding(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.red, lineWidth: 2)
            )
    }
}
