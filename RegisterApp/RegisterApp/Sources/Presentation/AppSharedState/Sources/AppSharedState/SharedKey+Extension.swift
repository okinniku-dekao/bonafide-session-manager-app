//
//  SharedKey+Extension.swift
//  AppSharedState
//
//  Created by 東　秀斗 on 2025/04/17.
//

import ComposableArchitecture

public extension SharedKey where Self == InMemoryKey<AppSharedState> {
    static var appSharedState: Self {
        inMemory("appSharedState")
    }
}
