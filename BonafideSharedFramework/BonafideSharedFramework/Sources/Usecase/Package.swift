// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Usecase",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Usecase",
            targets: ["Usecase"]
        ),
    ],
    dependencies: [
        .package(path: "../Domain")
    ],
    targets: [
        .target(
            name: "Usecase",
            dependencies: [
                "Domain"
            ]
        ),
        .testTarget(
            name: "UsecaseTests",
            dependencies: ["Usecase"]
        ),
    ]
)
