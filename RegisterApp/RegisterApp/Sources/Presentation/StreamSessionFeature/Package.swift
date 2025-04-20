// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StreamSessionFeature",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "StreamSessionFeature",
            targets: ["StreamSessionFeature"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.18.0"),
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.5.1"),
        .package(path: "../../../../../BonafideSharedFramework"),
        .package(path: "../AppSharedState")
    ],
    targets: [
        .target(
            name: "StreamSessionFeature",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Lottie", package: "lottie-spm"),
                .product(name: "Composition", package: "BonafideSharedFramework"),
                .product(name: "Domain", package: "BonafideSharedFramework"),
                .product(name: "PresentationHelper", package: "BonafideSharedFramework"),
                .product(name: "Resources", package: "BonafideSharedFramework"),
                "AppSharedState"
            ]
        ),
        .testTarget(
            name: "StreamSessionFeatureTests",
            dependencies: ["StreamSessionFeature"]
        ),
    ]
)
