// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Infrastructure",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Infrastructure",
            targets: ["Infrastructure"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain")
    ],
    targets: [
        .target(
            name: "Infrastructure",
            dependencies: [
                "Domain"
            ]
        ),
        .testTarget(
            name: "InfrastructureTests",
            dependencies: ["Infrastructure"]
        ),
    ]
)
