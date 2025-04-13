//
//  StoreDTO.swift
//  Data
//
//  Created by Claude on 2025/04/13.
//

import Foundation
import Domain

public enum StoreDTO: String, Codable, Equatable, CaseIterable {
    case seiwa
    case owada
    case yonematsu
    
    public func toDomain() -> Store {
        switch self {
        case .seiwa:
            return .seiwa
        case .owada:
            return .owada
        case .yonematsu:
            return .yonematsu
        }
    }
    
    public init(from domain: Store) {
        switch domain {
        case .seiwa:
            self = .seiwa
        case .owada:
            self = .owada
        case .yonematsu:
            self = .yonematsu
        }
    }
}
