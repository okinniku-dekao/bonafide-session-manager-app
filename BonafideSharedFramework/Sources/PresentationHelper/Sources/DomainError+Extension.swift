//
//  DomainError+Extension.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/18.
//

import Domain
import Resources

public extension DomainError {
    var iconName: String {
        switch self {
        case .networkError:
            return "wifi.slash"
        case .notFound:
            return "magnifyingglass"
        case .permissionDenied, .unauthorized:
            return "lock.shield"
        case .conflict:
            return "exclamationmark.triangle"
        case .faildSave:
            return "xmark.circle"
        case .validation:
            return "exclamationmark.circle"
        case .unknown:
            return "questionmark.circle"
        }
    }
    
    var title: String {
        switch self {
        case .networkError:
            return l10n.errorNetworkErrorTitle()
        case .notFound:
            return l10n.errorNotFoundTitle()
        case .permissionDenied:
            return l10n.errorPermissionDeniedTitle()
        case .conflict:
            return l10n.errorConflictTitle()
        case .unauthorized:
            return l10n.errorUnauthorizedTitle()
        case .faildSave:
            return l10n.errorFaildSaveTitle()
        case .validation(let validationError):
            return validationError.title
        case .unknown:
            return l10n.errorUnknownTitle()
        }
    }
    
    var message: String {
        switch self {
        case .networkError:
            return l10n.errorNetworkErrorMessage()
        case .notFound:
            return l10n.errorNotFoundMessage()
        case .permissionDenied:
            return l10n.errorPermissionDeniedMessage()
        case .conflict:
            return l10n.errorConflictMessage()
        case .unauthorized:
            return l10n.errorUnauthorizedMessage()
        case .faildSave:
            return l10n.errorFaildSaveMessage()
        case .validation(let validationError):
            return validationError.message
        case .unknown(let message):
            return l10n.errorUnknownMessage(message)
        }
    }
}

// ValidationErrorの拡張も追加
public extension Domain.ValidationError {
    var title: String {
        switch self {
        case .invalidUserName:
            return l10n.errorValidationInvalidUserNameTitle()
        case .invalidDeviceName:
            return l10n.errorValidationInvalidDeviceNameTitle()
        case .invalidMenuName:
            return l10n.errorValidationInvalidMenuNameTitle()
        case .invalidMenuNumber:
            return l10n.errorValidationInvalidMenuNumberTitle()
        case .invalidSatisfaction:
            return l10n.errorValidationInvalidSatisfactionTitle()
        case .invalidWeightValue:
            return l10n.errorValidationInvalidWeightValueTitle()
        case .invalidDurationValue:
            return l10n.errorValidationInvalidDurationValueTitle()
        }
    }
    
    var message: String {
        switch self {
        case .invalidUserName:
            return l10n.errorValidationInvalidUserNameMessage()
        case .invalidDeviceName:
            return l10n.errorValidationInvalidDeviceNameMessage()
        case .invalidMenuName:
            return l10n.errorValidationInvalidMenuNameMessage()
        case .invalidMenuNumber:
            return l10n.errorValidationInvalidMenuNumberMessage()
        case .invalidSatisfaction:
            return l10n.errorValidationInvalidSatisfactionMessage()
        case .invalidWeightValue:
            return l10n.errorValidationInvalidWeightValueMessage()
        case .invalidDurationValue:
            return l10n.errorValidationInvalidDurationValueMessage()
        }
    }
}
