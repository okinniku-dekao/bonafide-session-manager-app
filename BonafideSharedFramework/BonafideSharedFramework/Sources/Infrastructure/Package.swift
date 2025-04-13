// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Infrastructure",
    platforms: [.iOS(.v15), .macOS(.v10_15)],
    products: [
        .library(
            name: "Infrastructure",
            targets: ["Infrastructure"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "11.11.0"),
        .package(path: "../Domain")
    ],
    targets: [
        .target(
            name: "Infrastructure",
            dependencies: [
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                "Domain"
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "InfrastructureTests",
            dependencies: ["Infrastructure"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
