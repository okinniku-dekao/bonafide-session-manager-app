//
//  Effect+Extension.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import ComposableArchitecture

public extension Effect {
    static func stream<T: Equatable & Sendable>(
        _ stream: AsyncThrowingStream<T, any Error>,
        map action: @escaping @Sendable (T) -> Action,
        catch handler: (@Sendable (_ error: any Error, _ send: Send<Action>) async -> Void)? = nil
    ) -> Effect {
        .run { [action = action] send in
            for try await value in stream {
                await send(action(value))
            }
        } catch: {
            await handler?($0, $1)
        }
    }
}
