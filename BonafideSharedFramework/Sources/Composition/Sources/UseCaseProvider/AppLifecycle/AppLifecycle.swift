//
//  AppLifecycle.swift
//  BonafideSharedFramework
//
//  Created by 東　秀斗 on 2025/04/24.
//

import Dependencies
@preconcurrency import UIKit

public struct AppLifecycle: Sendable {
    public var background: @Sendable () -> AsyncStream<Void>
    public var foreground: @Sendable () -> AsyncStream<Void>
}

public extension DependencyValues {
    var appLifecycle: AppLifecycle {
        get { self[AppLifecycle.self] }
        set { self[AppLifecycle.self] = newValue }
    }
}

extension AppLifecycle: DependencyKey {
    public static var liveValue: AppLifecycle {
        Self(
            background: {
                AsyncStream<Void> { continuation in
                    let observer = NotificationCenter.default.addObserver(
                        forName: UIApplication.didEnterBackgroundNotification,
                        object: nil,
                        queue: nil
                    ) { _ in
                        continuation.yield(())
                    }
                    
                    continuation.onTermination = { _ in
                        NotificationCenter.default.removeObserver(observer)
                    }
                }
            },
            foreground: {
                AsyncStream<Void> { continuation in
                    let observer = NotificationCenter.default.addObserver(
                        forName: UIApplication.willEnterForegroundNotification,
                        object: nil,
                        queue: nil
                    ) { _ in
                        continuation.yield(())
                    }
                    
                    continuation.onTermination = { _ in
                        NotificationCenter.default.removeObserver(observer)
                    }
                }
            }
        )
    }
    
    public static var testValue: AppLifecycle {
        Self(
            background: { .never },
            foreground: { .never }
        )
    }
}
