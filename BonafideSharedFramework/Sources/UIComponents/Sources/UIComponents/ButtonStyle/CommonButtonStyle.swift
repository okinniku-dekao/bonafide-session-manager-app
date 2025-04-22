//
//  CommonButtonStyle.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/22.
//

import SwiftUI
import Resources

public struct CommonButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(uiColor: sharedColors.primary()!))
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal)
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}
