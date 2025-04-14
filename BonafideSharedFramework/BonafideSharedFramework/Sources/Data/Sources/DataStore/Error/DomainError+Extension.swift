//
//  DomainError+Extension.swift
//  Data
//
//  Created by 東　秀斗 on 2025/04/13.
//

import Domain

public extension DomainError {
    init(from error: DataStoreError) {
        self = DomainError.validation(.invalidUserName)
    }
}
