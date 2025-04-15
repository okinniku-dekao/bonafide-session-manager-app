//
//  MenuCategory.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/15.
//

public enum RecordType: Equatable, Sendable, CaseIterable {
    case timeBase
    case weightBase
    
    init(_ category: MenuCategory) {
        switch category {
        case .stretch:
            self = .timeBase
        case .pilates:
            self = .timeBase
        case .lowerBody:
            self = .weightBase
        case .chest:
            self = .weightBase
        case .shoulder:
            self = .weightBase
        case .back:
            self = .weightBase
        case .abdominal:
            self = .timeBase
        case .arm:
            self = .weightBase
        case .other:
            self = .timeBase
        }
    }
}
