//
//  ErrorOverlay.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/17.
//

import SwiftUI
import Domain
import ComposableArchitecture

public extension View {
    @ViewBuilder
    func errorOverlay(
        error: DomainError?,
        retryAction: (() -> Void)? = nil,
    ) -> some View {
        if let error {
            self.overlay {
                ErrorView(error) {
                    retryAction?()
                }
            }
        } else {
            self
        }
    }
}
