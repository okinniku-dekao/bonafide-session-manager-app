//
//  AlertState+Extension.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import ComposableArchitecture
import Domain
import Resources

public extension AlertState {
    static func validationAlert(_ error: Domain.ValidationError) -> AlertState {
        AlertState {
            TextState(l10n.alertErrorTitle())
        } actions: {
            ButtonState {
                TextState(l10n.alertOk())
            }
        } message: {
            TextState(error.message)
        }
    }
}
