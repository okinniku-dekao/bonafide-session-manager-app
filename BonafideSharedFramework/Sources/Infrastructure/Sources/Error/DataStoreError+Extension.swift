//
//  DataStoreError+Extension.swift
//  Infrastructure
//
//  Created by 東　秀斗 on 2025/04/14.
//

import Data
import FirebaseFirestore

extension DataStoreError {
    public init(from error: Error) {
        guard let err = error as NSError?,
              err.domain == FirestoreErrorDomain,
              let code = FirestoreErrorCode.Code(rawValue: err.code) else {
            self = .unknown(error.localizedDescription)
            return
        }
        
        switch code {
        case .cancelled: self = .cancelled
        case .unknown: self = .unknown(error.localizedDescription)
        case .invalidArgument: self = .invalidArgument
        case .deadlineExceeded: self = .deadlineExceeded
        case .notFound: self = .notFound
        case .alreadyExists: self = .alreadyExists
        case .permissionDenied: self = .permissionDenied
        case .resourceExhausted: self = .resourceExhausted
        case .failedPrecondition: self = .failedPrecondition
        case .aborted: self = .aborted
        case .outOfRange: self = .outOfRange
        case .unauthenticated: self = .unauthenticated
        case .unavailable: self = .unavailable
        default: self = .unknown(error.localizedDescription)
        }
    }
}
