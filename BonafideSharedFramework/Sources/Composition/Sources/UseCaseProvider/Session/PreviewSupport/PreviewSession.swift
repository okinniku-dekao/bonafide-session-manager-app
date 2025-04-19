//
//  PreviewSession.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/19.
//

import Foundation
import Domain

struct PreviewStreamSessionsUseCase: StreamSessionsUseCase {
    func callAsFunction(userId: String) async -> AsyncThrowingStream<[Session], any Error> {
        AsyncThrowingStream { continuation in
            let mockSessions: [Session] = [
                Session(id: UUID().uuidString, name: "トレーニング1", note: "", number: 1, path: ""),
                Session(id: UUID().uuidString, name: "トレーニング2", note: "", number: 2, path: ""),
                Session(id: UUID().uuidString, name: "トレーニング3", note: "", number: 3, path: ""),
            ]

            continuation.yield(mockSessions)
            continuation.finish()
        }
    }
}
