// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
@_exported import RswiftResources

public let l10n = R.string.localizable
public let sharedColors = R.color

public enum AnimationAsset {
    private static let bundle = Bundle.module
    
    public static func url(_ name: String) -> URL? {
        guard let path = bundle.path(forResource: name, ofType: "gif", inDirectory: "gif") else {
            return nil
        }
        return URL(fileURLWithPath: path)
    }
}
