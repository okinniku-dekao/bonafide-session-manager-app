// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StreamSessionFeature",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "StreamSessionFeature",
            targets: ["StreamSessionFeature"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.18.0"),
        .package(path: "../../../../../BonafideSharedFramework")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "StreamSessionFeature",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "Composition", package: "BonafideSharedFramework"),
                .product(name: "Domain", package: "BonafideSharedFramework"),
                .product(name: "PresentationHelper", package: "BonafideSharedFramework")
            ]
        ),
        .testTarget(
            name: "StreamSessionFeatureTests",
            dependencies: ["StreamSessionFeature"]
        ),
    ]
)
