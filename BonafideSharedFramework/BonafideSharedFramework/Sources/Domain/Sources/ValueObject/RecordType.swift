//
//  MenuCategory.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/15.
//

public enum RecordType: Equatable, Sendable, CaseIterable {
    case timeBase
    case weightBase
    
    init(_ number: Int) {
        switch number {
        case 100...300:
            self = .timeBase
        case 700...800:
            self = .timeBase
        case 900...:
            self = .timeBase
        default:
            self = .weightBase
        }
    }
}
