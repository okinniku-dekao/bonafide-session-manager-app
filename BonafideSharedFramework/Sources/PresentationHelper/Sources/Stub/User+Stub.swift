//
//  User+Stub.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/19.
//

import Domain

#if DEBUG
public extension User {
    static let preview: User = .newUser(name: "Previewユーザー")
}
#endif
