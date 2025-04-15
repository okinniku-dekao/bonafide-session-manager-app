//
//  DataStoreError.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public enum DataStoreError: Error, Equatable {
    case notFound
    case alreadyExists
    case permissionDenied
    case unavailable
    case unauthenticated
    case cancelled
    case deadlineExceeded
    case invalidArgument
    case resourceExhausted
    case aborted
    case outOfRange
    case failedPrecondition
    case unknown(String) // エラーメッセージなど任意の情報を保持したい時に使う
}
