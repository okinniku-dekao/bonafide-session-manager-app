//
//  LoadStatus.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import Domain

public enum LoadStatus<T: Equatable>: Equatable {
    case idle
    case loading
    case loaded(T)
    case error(DomainError)
    
    public var value: T? {
        if case .loaded(let value) = self {
            return value
        }
        return nil
    }
    
    public var isLoading: Bool {
        if case .loading = self {
            return true
        }
        return false
    }
    
    public var isLoaded: Bool {
        value != nil
    }
    
    public var isError: Bool {
        if case .error = self {
            return true
        }
        return false
    }
    
    public var error: DomainError? {
        if case .error(let error) = self {
            return error
        }
        return nil
    }
}
