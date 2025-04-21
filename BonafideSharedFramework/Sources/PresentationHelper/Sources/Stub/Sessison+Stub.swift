//
//  Sessison+Stub.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/21.
//

import Domain
import Foundation

#if DEBUG
public extension Session {
    static func preview(name: String = "トレーニング", path: String = "") -> Session {
        .init(id: UUID().uuidString, name: name, note: "", number: 0, path: path)
    }
}
#endif
