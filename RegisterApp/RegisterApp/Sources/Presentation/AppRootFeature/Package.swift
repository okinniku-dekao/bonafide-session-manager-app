// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AppRootFeature",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppRootFeature",
            targets: ["AppRootFeature"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.18.0"),
        .package(path: "../../../../../BonafideSharedFramework"),
        .package(path: "../RegisterDeviceFeature"),
        .package(path: "../MainTabFeature")
    ],
    targets: [
        .target(
            name: "AppRootFeature",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Composition", package: "BonafideSharedFramework"),
                .product(name: "Domain", package: "BonafideSharedFramework"),
                .product(name: "PresentationHelper", package: "BonafideSharedFramework"),
                "RegisterDeviceFeature",
                "MainTabFeature"
            ]
        ),
        .testTarget(
            name: "AppRootFeatureTests",
            dependencies: ["AppRootFeature"]
        ),
    ]
)
