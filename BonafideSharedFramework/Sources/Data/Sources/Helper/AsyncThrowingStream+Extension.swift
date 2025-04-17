//
//  AsyncThrowingStream+Extension.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/17.
//

import Domain

extension AsyncThrowingStream where Element: Sendable {
    func mapStream<T>(
        _ transform: @escaping @Sendable (Element) -> T
    ) -> AsyncThrowingStream<T, any Error> {
        AsyncThrowingStream<T, any Error> { continuation in
            Task {
                do {
                    for try await value in self {
                        continuation.yield(transform(value))
                    }
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: DomainError(from: error as! DataStoreError))
                }
            }
        }
    }
}
