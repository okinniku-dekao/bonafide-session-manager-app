//
//  DomainError+Extension.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public extension DomainError {
    init(from error: DataStoreError) {
        switch error {
        case .notFound:
            self = .notFound
        case .alreadyExists:
            self = .conflict
        case .permissionDenied:
            self = .permissionDenied
        case .unavailable, .cancelled, .deadlineExceeded, .resourceExhausted:
            self = .networkError
        case .unauthenticated:
            self = .unauthorized
        case .invalidArgument, .aborted, .outOfRange, .failedPrecondition:
            self = .unknown("\(error)")
        case .unknown(let message):
            self = .unknown(message)
        }
    }
}
