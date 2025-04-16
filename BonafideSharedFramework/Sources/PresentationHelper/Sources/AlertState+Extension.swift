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

private extension Domain.ValidationError {
    var message: String {
        switch self {
        case .invalidUserName: return l10n.invalidUserNameMessage()
        case .invalidDeviceName: return l10n.invalidDeviceNameMessage()
        case .invalidMenuName: return l10n.invalidMenuNameMessage()
        case .invalidMenuNumber: return l10n.invalidMenuNumberMessage()
        case .invalidSatisfaction: return l10n.invalidSatisfactionMessage()
        case .invalidWeightValue: return l10n.invalidWeightValueMessage()
        case .invalidDurationValue: return l10n.invalidDurationValueMessage()
        }
    }
}
