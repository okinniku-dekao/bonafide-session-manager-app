//
//  Effect+Extension.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/16.
//

import ComposableArchitecture
import Domain
import Composition

public extension Effect {
    static func stream<T: Equatable & Sendable>(
        _ stream: @escaping @Sendable () async throws -> AsyncThrowingStream<T, any Error>,
        map action: @escaping @Sendable (T) -> Action,
        catch handler: (@Sendable (_ error: DomainError, _ send: Send<Action>) async -> Void)? = nil
    ) -> Effect {
        .run { [action = action] send in
            for try await value in try await stream() {
                await send(action(value))
            }
        } catch: {
            await handler?($0 as! DomainError, $1)
        }
    }
    
    static func runDomainError(
        operation: @escaping @Sendable (_ send: Send<Action>) async throws -> Void,
        catch handler: @escaping @Sendable (_ error: DomainError, _ send: Send<Action>) async -> Void
    ) -> Effect {
        .run { send in
            try await operation(send)
        } catch: { error, send in
            guard let domainError = error as? DomainError else {
                assertionFailure("Unexpected error type: \(error)")
                return
            }
            await handler(domainError, send)
        }
    }
    
    static func lifecycleObserver(
        inBackground backgroundAction: @escaping @Sendable  (_ send: Send<Action>) async -> Void,
        inForeground foregroundAction: @escaping @Sendable  (_ send: Send<Action>) async -> Void,
    ) -> Effect {
        @Dependency(\.appLifecycle) var appLifecycle
        return .merge(
            .run { send in
                for await _ in appLifecycle.background() {
                    await backgroundAction(send)
                }
            },
            .run { send in
                for await _ in appLifecycle.foreground() {
                    await foregroundAction(send)
                }
            }
        )
    }
}
