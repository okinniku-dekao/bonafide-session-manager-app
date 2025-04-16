//
//  DomainError.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/13.
//


public enum DomainError: Equatable, Error {
    case validation(ValidationError)
    case networkError
    case permissionDenied
    case notFound
    case conflict
    case unauthorized
    case faildSave
    case unknown(String)
}
