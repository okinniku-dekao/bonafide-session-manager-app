//
//  WithTrackingPerceptionModifier.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/17.
//

import SwiftUI
import ComposableArchitecture

private struct WithTrackingPerceptionModifier: ViewModifier {
    func body(content: Content) -> some View {
        WithPerceptionTracking {
            content
        }
    }
}

public extension View {
    func trackingPerception() -> some View {
        self.modifier(WithTrackingPerceptionModifier())
    }
}
