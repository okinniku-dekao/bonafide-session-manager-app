//
//  CustomWeightInputView.swift
//  RegisterTrainingFeature
//
//  Created by 東　秀斗 on 2025/06/01.
//

import SwiftUI

struct CustomWeightInputView: View {
    @Binding private var weightText: String
    
    init(weightText: Binding<String>) {
        self._weightText = weightText
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("手動で重量を入力")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.secondary)
            
            TextField("重量 (kg)", text: $weightText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color(UIColor.secondarySystemBackground))
                .keyboardType(.decimalPad)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
    }
}

#Preview {
    CustomWeightInputView(weightText: .constant(""))
}
