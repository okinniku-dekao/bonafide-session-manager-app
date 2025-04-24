// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BonafideSharedFramework",
    defaultLocalization: "ja",
    platforms: [.iOS(.v15), .macOS(.v10_15)],
    products: [
        .library(
            name: "Domain",
            targets: ["Domain"]
        ),
        .library(
            name: "Data",
            targets: ["Data"]
        ),
        .library(
            name: "Usecase",
            targets: ["Usecase"]
        ),
        .library(
            name: "Infrastructure",
            targets: ["Infrastructure"]
        ),
        .library(
            name: "Composition",
            targets: ["Composition"]
        ),
        .library(
            name: "UIComponents",
            targets: ["UIComponents"]
        ),
        .library(
            name: "Resources",
            targets: ["Resources"]
        ),
        .library(
            name: "PresentationHelper",
            targets: ["PresentationHelper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.9.1"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.19.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "11.11.0"),
        .package(url: "https://github.com/mac-cain13/R.swift.git", from: "7.8.0"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "3.1.3")
    ],
    targets: [
        .target(
            name: "Domain",
            path: "Sources/Domain"
        ),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"],
            path: "Tests/DomainTests"
        ),
        .target(
            name: "Data",
            dependencies: ["Domain"],
            path: "Sources/Data"
        ),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"],
            path: "Tests/DataTests"
        ),
        .target(
            name: "Usecase",
            dependencies: ["Domain"],
            path: "Sources/Usecase"
        ),
        .testTarget(
            name: "UsecaseTests",
            dependencies: ["Usecase"],
            path: "Tests/UsecaseTests"
        ),
        .target(
            name: "Infrastructure",
            dependencies: [
                .product(name: "FirebaseFirestore", package: "firebase-ios-sdk"),
                "Domain",
                "Data"
            ],
            path: "Sources/Infrastructure"
        ),
        .testTarget(
            name: "InfrastructureTests",
            dependencies: ["Infrastructure"],
            path: "Tests/InfrastructureTests"
        ),
        .target(
            name: "Composition",
            dependencies: [
                .product(name: "Dependencies", package: "swift-dependencies"),
                "Domain",
                "Data",
                "Infrastructure",
                "Usecase"
            ],
            path: "Sources/Composition"
        ),
        .testTarget(
            name: "CompositionTests",
            dependencies: ["Composition"],
            path: "Tests/CompositionTests"
        ),
        .target(
            name: "UIComponents",
            dependencies: [
                .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI"),
                "Resources",
                "PresentationHelper"
            ],
            path: "Sources/UIComponents"
        ),
        .target(
            name: "Resources",
            dependencies: [.product(name: "RswiftLibrary", package: "R.swift")],
            path: "Sources/Resources",
            resources: [
                .process("Sources/Resources/Assets"),
                .copy("Sources/Resources/gif")
            ],
            plugins: [.plugin(name: "RswiftGeneratePublicResources", package: "R.swift")]
        ),
        .target(
            name: "PresentationHelper",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "Domain",
                "Resources",
                "Composition"
            ],
            path: "Sources/PresentationHelper"
        )
    ],
    swiftLanguageModes: [.v6]
)
