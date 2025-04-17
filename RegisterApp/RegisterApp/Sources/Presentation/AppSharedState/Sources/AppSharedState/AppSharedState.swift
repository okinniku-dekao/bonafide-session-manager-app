// The Swift Programming Language
// https://docs.swift.org/swift-book

import Domain

public struct AppSharedState: Equatable, Sendable {
    public init() {}
    
    public private(set) var connectedUser: User?
    
    public mutating func setUser(_ newUser: User) {
        self.connectedUser = newUser
    }
}
