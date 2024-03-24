// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BackendlessAndPromises",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "BackendlessAndPromises",
            targets: ["BackendlessAndPromises"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/google/promises.git", from: "2.3.1"),
        .package(url: "https://github.com/Backendless/Swift-SDK.git", from: "7.0.4"),
    ],
    targets: [
        .target(
            name: "BackendlessAndPromises",
            dependencies: [
                .product(name: "Promises", package: "promises"),
                .product(name: "Backendless", package: "Swift-SDK")
            ]
        ),
        .testTarget(
            name: "BackendlessAndPromisesTests",
            dependencies: [
                .target(name: "BackendlessAndPromises")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
