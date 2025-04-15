//
//  MenuCategory.swift
//  Domain
//
//  Created by 東　秀斗 on 2025/04/15.
//

public enum MenuCategory: Equatable, Sendable, Hashable, CaseIterable {
    /// ストレッチ
    case stretch
    /// ピラティス
    case pilates
    /// 下半身
    case lowerBody
    /// 胸
    case chest
    /// 肩
    case shoulder
    /// 背中
    case back
    /// 腹筋
    case abdominal
    /// 腕
    case arm
    /// その他
    case other
    
    public var recordType: RecordType {
        RecordType(self)
    }
    
    public init(_ menuNumber: Int) {
        switch menuNumber {
        case 100...200:
            self = .stretch
        case 200...300:
            self = .pilates
        case 300...400:
            self = .lowerBody
        case 400...500:
            self = .chest
        case 500...600:
            self = .shoulder
        case 600...700:
            self = .back
        case 700...800:
            self = .abdominal
        case 800...900:
            self = .arm
        case 900...:
            self = .other
        default:
            self = .other
        }
    }
}
