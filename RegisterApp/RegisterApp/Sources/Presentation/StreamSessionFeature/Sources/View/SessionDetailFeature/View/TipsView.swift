//
//  TipsView.swift
//  StreamSessionFeature
//
//  Created by 東　秀斗 on 2025/04/23.
//

import SwiftUI
import Resources

struct TipsView: View {
    let note: String
    private let fillColor: UIColor = sharedColors.primary()!
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 24))
                
                Text("TIPS")
                    .fontWeight(.semibold)
                    .kerning(1.2)
                    .foregroundColor(.black)
            }
            .padding(.bottom, 12)
            
            Text(note)
                .lineSpacing(12)
                .foregroundColor(Color.black)
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(uiColor: fillColor).opacity(0.15))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.primary.opacity(0.5), lineWidth: 2)
                )
        )
        .padding(EdgeInsets(top: 5, leading: 16, bottom: 10, trailing: 16))
    }
}

#Preview {
    VStack {
        TipsView(note: "短い文字")
        TipsView(note: "長い文字列長い文字列長い文字列長い文字列長い文字列長い文字列")
    }
}
