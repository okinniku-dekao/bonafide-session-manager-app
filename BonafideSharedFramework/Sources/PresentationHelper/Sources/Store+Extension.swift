//
//  Store+Extension.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import Domain

public extension Store {
    var label: String {
        switch self {
        case .owada: return "大和田"
        case .seiwa: return "成和"
        case .yonematsu: return "米松"
        }
    }
}
