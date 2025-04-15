// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BonafideSharedFramework",
    platforms: [.iOS(.v15), .macOS(.v10_15)],
    products: [
        // 個別のモジュールも必要に応じて使用できるようにします
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
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.9.1"),
    ],
    targets: [
        .target(
            name: "Domain",
            path: "BonafideSharedFramework/Sources/Domain"
        ),
        .target(
            name: "Data",
            dependencies: ["Domain"],
            path: "BonafideSharedFramework/Sources/Data"
        ),
        .target(
            name: "Usecase",
            dependencies: ["Domain"],
            path: "BonafideSharedFramework/Sources/Usecase"
        ),
        .target(
            name: "Infrastructure",
            dependencies: ["Domain"],
            path: "BonafideSharedFramework/Sources/Infrastructure"
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
            path: "BonafideSharedFramework/Sources/Composition"
        ),
        .target(
            name: "UIComponents",
            path: "BonafideSharedFramework/Sources/UIComponents"
        ),
        .target(
            name: "Resources",
            path: "BonafideSharedFramework/Sources/Resources"
        ),
        // テストターゲットも必要に応じて追加できます
    ],
    swiftLanguageModes: [.v6]
)
